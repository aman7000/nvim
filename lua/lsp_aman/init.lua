local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "lsp_aman.lsp-installer"
require("lsp_aman.handlers").setup()
require "lsp_aman.null-ls"
