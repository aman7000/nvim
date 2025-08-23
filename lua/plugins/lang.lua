-- lua/plugins/dap.lua
return {
  -- JS/TS/Svelte debugger
  {
    "mxsdev/nvim-dap-vscode-js",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dap-vscode-js").setup({
        debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter"),
        adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
      })
    end,
  },

  -- Zig (no extra, so manual adapter config)
  {
    "ziglang/zig.vim", -- Optional for syntax/LSP, but useful
    ft = "zig",
  },
}
