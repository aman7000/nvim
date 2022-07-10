local dap = require("dap")
local dapui = require("dapui")
local dap_install = require("dap-install")

dap_install.setup {}

dap_install.config("python", {})
-- add other configs here

dapui.setup {
  layouts = {
    elements = {
        "scopes",
        "breakpoints",
        "stacks",
        "watches",
    },
    size = 40,
    position = "left", -- Can be "left", "right", "top", "bottom"
  },
  {
    elements = {
        "repl",
        "console",
    },
    size = 10,
    position = "bottom",
  }
}

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
