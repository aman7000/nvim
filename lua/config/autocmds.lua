-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- lua/config/autocmds.lua
-- lua/config/autocmds.lua

vim.api.nvim_create_autocmd({ "BufEnter", "LspAttach" }, {
    callback = function(ev)
        vim.api.nvim_set_hl(0, "Comment", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "LspInlayHint", { bg = "NONE", fg = "#3b3b3b" })
        vim.lsp.inlay_hint.enable(true)
        vim.api.nvim_set_hl(0, "String", { bg = "NONE" }) -- New: Remove bg from strings
    end,
})
