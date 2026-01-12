-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- lua/config/keymaps.lua
vim.keymap.set("n", "<leader>cH", "<cmd>Codeium Auth<cr>", { desc = "Codeium: Auth" })
vim.keymap.set("n", "<leader>ch", "<cmd>Codeium Chat<cr>", { desc = "Codeium: Chat" })
vim.keymap.set("n", "<leader>ct", "<cmd>Codeium Toggle<cr>", { desc = "Codeium: Toggle" })

-- vim.keymap.set("n", "<leader>aa", "<cmd>Avante<cr>", { desc = "Avante Chat" })
-- vim.keymap.set("v", "<leader>ae", "<cmd>Avante<cr>", { desc = "Avante Edit Selection" })
