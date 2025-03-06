require "nvchad.options"
require('telescope').setup({
	defaults = {
		-- Add folders or patterns you want to ignore below
		file_ignore_patterns = {
			"node_modules",
			".git/",
			"dist",
			"build",
			"target"
		},
	},
})
local function get_context_lines()
	local bufnr = vim.api.nvim_get_current_buf()
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	local current_line = vim.api.nvim_get_current_line()
	local start_line = math.max(0, cursor_pos[1] - 3)                             -- Get 3 lines above
	local end_line = math.min(cursor_pos[1] + 2, vim.api.nvim_buf_line_count(bufnr)) -- Get 2 lines below

	local lines = vim.api.nvim_buf_get_lines(bufnr, start_line, end_line, false)
	return table.concat(lines, "\n")
end

local function suggest_with_context()
	local context = get_context_lines()

	local Job = require('plenary.job')
	Job:new({
		command = "curl",
		args = {
			"-X", "POST",
			"-H", "Content-Type: application/json",
			"-d", vim.fn.json_encode({
			model = "mistral-nemo", -- Replace with the specific model name if needed
			prompt = "Provide suggestions for the following code:\n\n" .. context,
		}),
			"http://localhost:11434/api/generate" -- Ollama API endpoint
		},
		on_exit = function(job, return_val)
			local response = table.concat(job:result(), "\n")
			vim.schedule(function()
				-- Open a scratch buffer to display the response
				local buf = vim.api.nvim_create_buf(false, true)
				vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(response, "\n"))
				vim.api.nvim_set_current_buf(buf)
			end)
		end,
	}):start()
end

-- Key mapping to invoke the context-aware suggestions
vim.keymap.set('n', '<leader>cc', suggest_with_context, { noremap = true, silent = true })


-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
