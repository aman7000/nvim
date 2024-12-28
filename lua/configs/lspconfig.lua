-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local inlayhints = require("lsp-inlayhints")

-- Enable global inlay hints
inlayhints.setup()

-- Setup for rust-analyzer
lspconfig.rust_analyzer.setup({
  on_attach = function(client, bufnr)
    -- Attach inlay hints for Rust
    inlayhints.on_attach(client, bufnr)

    -- Set keybindings for inlay hints toggle (optional)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lh", ":lua require('lsp-inlayhints').toggle()<CR>", opts)
  end,
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = {
        command = "clippy",
      },
      inlayHints = {
        enable = true,
        typeHints = true,
        chainingHints = true,
        parameterHints = true,
      },
    },
  },
})

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
