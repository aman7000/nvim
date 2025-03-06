vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "


-- Set tab width to 4 spaces globally
vim.opt.tabstop = 4        -- Number of spaces that a <Tab> counts for
vim.opt.shiftwidth = 4     -- Number of spaces used for autoindent
vim.opt.expandtab = false  -- Use spaces instead of tabs
vim.opt.smarttab = true    -- Make <Tab>/<BS> smarter
vim.opt.autoindent = true  -- Copy indent from the current line
vim.opt.smartindent = true -- Auto-indent new lines

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.expandtab = false
	end,
})

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
	{
		"NvChad/NvChad",
		lazy = false,
		branch = "v2.5",
		import = "nvchad.plugins",
	},

	{ import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
	require "mappings"
end)

vim.opt.number = true         -- Show the absolute line number for the current line
vim.opt.relativenumber = true -- Show relative line numbers for all other lines

vim.opt.cursorline = true     -- Highlight the current row
vim.opt.cursorcolumn = true   -- Highlight the current column

vim.cmd([[
    highlight CursorLine cterm=NONE ctermbg=darkgray guibg=#2E2E2E
    highlight CursorColumn cterm=NONE ctermbg=darkgray guibg=#2E2E2E
]])
