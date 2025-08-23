-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

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
