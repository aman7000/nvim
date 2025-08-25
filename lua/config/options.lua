-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.g.maplocalleader = ","

-- Set tab width to 4 spaces globally
vim.opt.tabstop = 4 -- Number of spaces that a <Tab> counts for
vim.opt.shiftwidth = 4 -- Number of spaces used for autoindent
vim.opt.expandtab = false -- Use spaces instead of tabs
vim.opt.smarttab = true -- Make <Tab>/<BS> smarter
vim.opt.autoindent = true -- Copy indent from the current line
vim.opt.smartindent = true -- Auto-indent new lines

vim.opt.number = true -- Show the absolute line number for the current line
vim.opt.relativenumber = true -- Show relative line numbers for all other lines

vim.opt.cursorline = true -- Highlight the current row
vim.opt.cursorcolumn = true -- Highlight the current column
vim.opt.cursorlineopt = "line" -- "number" for just the number, "both" for both

vim.o.background = "dark"
vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_hl(0, "Comment", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "LspInlayHint", { bg = "NONE" }) -- Omit fg to keep ayu's default; add if visibility is poor, e.g., fg = "#939293"
        vim.api.nvim_set_hl(0, "String", { bg = "NONE" }) -- New: Remove bg from strings
        -- Set lighter background for cursor line (adjust #3a3a3a to your preferred lighter hex)
        -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#3a3a3a" })

        -- Set lighter background for cursor column (same as above)
        -- vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#3a3a3a" })
    end,
})

-- uncomment following to make background transparent
-- -- lua/ui/transparent.lua
-- local function clear_bg()
--     for _, grp in ipairs({
--         "Normal",
--         "NormalNC",
--         "NormalFloat",
--         "FloatBorder",
--         "SignColumn",
--         "LineNr",
--         "EndOfBuffer",
--         "StatusLine",
--         "TelescopeNormal",
--         "TelescopeBorder",
--         "TelescopePromptNormal",
--         "TelescopePromptBorder",
--         "TelescopeResultsNormal",
--         "TelescopeResultsBorder",
--         "TelescopePreviewNormal",
--         "TelescopePreviewBorder",
--         "TelescopeTitle",
--         "TelescopePromptTitle",
--         "TelescopeResultsTitle",
--         "TelescopePreviewTitle",
--         "NeoTreeNormal",
--         "NeoTreeNormalNC",
--         "NvimTreeNormal",
--         "Pmenu",
--         "String",
--         "Comment",
--     }) do
--         pcall(vim.api.nvim_set_hl, 0, grp, { bg = "NONE" })
--     end
-- end
-- -- "CursorLine", "CursorLineNr",
--
-- vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
--     callback = clear_bg,
-- })
--
-- -- optional: make popups slightly see-through (UI blend)
-- vim.opt.winblend = 0
-- vim.opt.pumblend = 0
--
-- -- optional toggle
-- vim.keymap.set("n", "<leader>ut", function()
--     local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
--     local is_transparent = not normal.bg or normal.bg == "" or normal.bg == "NONE"
--     if is_transparent then
--         -- restore with a subtle bg if you like
--         vim.api.nvim_set_hl(0, "Normal", { bg = "#111111" })
--     else
--         clear_bg()
--     end
-- end, { desc = "Toggle Transparency" })
