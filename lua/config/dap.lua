-- lua/config/dap.lua
local dap = require("dap")

-- Rust: Already handled by extras.lang.rust (uses rust-tools with codelldb)
-- Customize if needed:
dap.configurations.rust = {
  {
    name = "Launch Debug",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}

-- Zig: Use codelldb
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
    args = { "--port", "${port}" },
  },
}
dap.configurations.zig = {
  {
    name = "Launch Zig",
    type = "codelldb",
    request = "launch",
    program = "${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}",
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}

-- JavaScript/TypeScript/Svelte
for _, lang in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte" }) do
  dap.configurations[lang] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Node",
      program = "${file}",
      cwd = "${workspaceFolder}",
      sourceMaps = true,
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach Node",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
      sourceMaps = true,
    },
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Launch Chrome (for Svelte/web)",
      url = "http://localhost:3000", -- Adjust for your dev server (e.g., 5173 for Vite/SvelteKit)
      webRoot = "${workspaceFolder}",
      sourceMaps = true,
      skipFiles = { "<node_internals>/**", "node_modules/**" },
    },
  }
end

-- Lua: Handled by extras.dap.nlua; default config launches current file
-- Add custom if needed:
dap.configurations.lua = {
  {
    type = "nlua",
    request = "attach",
    name = "Attach to running Neovim",
    host = function()
      return "127.0.0.1"
    end,
    port = function()
      return tonumber(vim.fn.input("Port: ", "54321"))
    end,
  },
}
