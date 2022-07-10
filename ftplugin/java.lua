local api = vim.api
local dap = require('dap')
local M = {}
-- dap.adapters.java = function(callback, config)
--     M.execute_command({command = 'vscode.java.startDebugSession'}, function(err0, port)
--         assert(not err0, vim.inspect(err0))
--         callback({ type = 'server'; host = '127.0.0.1'; port = port; })
--     end)
-- end


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local workspace_dir = '/Users/amansingh/.workspace/' .. project_name

local config = {
  cmd = {'sh','jdtls_launch', workspace_dir},
  root_dir = require('jdtls.setup').find_root({'.git','mvnw','gradlew'}),
  capabilities = capabilities,
  settings = {
    java = {
      configuration = {
        -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
        -- And search for `interface RuntimeOption`
        -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
        -- runtimes = {
        --   {
        --     name = "JavaSE-8",
        --     path = "/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home/",
        --   },
          -- {
          --   name = "JavaSE-11",
          --   path = "/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/",
          -- },
        -- }
      }
    }
  },
  init_options = {
    bundles = {
      vim.fn.glob(
            '/Users/amansingh/' ..
            'development/com.microsoft.java.debug.plugin-0.35.0.jar'),
    },
  }
}
config['on_attach'] = function(client, bufnr)
  -- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
  -- you make during a debug session immediately.
  -- Remove the option if you do not want that.
  require('jdtls').setup_dap({ hotcodereplace = 'auto' })
  require('jdtls.dap').setup_dap_main_class_configs()
end

function M.execute_buf_command(command, callback)
    vim.lsp.buf_request(
        0, 'workspace/executeCommand', command, function(err, _, res)
            if callback then
                callback(err, res)
            elseif err then
                print('Execute command failed: ' .. err.message)
            end
        end)
end

-- function M.execute_command(command, callback)
--     if type(command) == 'string' then command = { command = command } end

--     M.execute_buf_command(
--         command, function(err, res)
--             assert(not err, err and (err.message or Log.ins(err)))
--             callback(res)
--         end)
-- end

function M.setup()
  dap.listeners.after.event_initialized['me-keys'] = function()
    api.nvim_set_keymap("n", "<down>", "<cmd>lua require('dap').step_over()<CR>", {noremap = true, silent = true})
    api.nvim_set_keymap("n", "<left>", "<cmd>lua require('dap').step_out()<CR>", {noremap = true, silent = true})
    api.nvim_set_keymap("n", "<right>", "<cmd>lua require('dap').step_into()<CR>", {noremap = true, silent = true})
  end
  dap.listeners.after.event_terminated['me-keys'] = function()
    api.nvim_del_keymap("n", "<down>")
    api.nvim_del_keymap("n", "<left>")
    api.nvim_del_keymap("n", "<right>")
  end

  dap.defaults.fallback.terminal_win_cmd = 'tabnew'

  dap.configurations.java = {
    {
      type = 'java';
      request = 'attach';
      name = "Debug (Attach) - Remote";
      hostName = "127.0.0.1";
      port = 5005;
    },
  }
  require('dap.ext.vscode').load_launchjs()
  require('jdtls').start_or_attach(config)
end
M.setup()


local opts = { noremap=true, silent=true }

-- GOTO mappings
vim.api.nvim_set_keymap('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n','K','<cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_set_keymap('n','gr','<cmd>lua vim.lsp.buf.references()<CR>', opts)
vim.api.nvim_set_keymap('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.api.nvim_set_keymap('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n','<leader>gt','<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
vim.api.nvim_set_keymap('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
vim.api.nvim_set_keymap('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
-- ACTION vim.api.nvim_set_keymappings
vim.api.nvim_set_keymap('n','<leader>ah',  '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_set_keymap('n','<leader>af', '<cmd>lua require"jdtls".code_action()<CR>', { silent=true })
vim.api.nvim_set_keymap('n','<leader>ar',  '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
-- Few language severs support these three
vim.api.nvim_set_keymap('n','<leader>=',  '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
vim.api.nvim_set_keymap('n','<leader>ai',  '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts)
vim.api.nvim_set_keymap('n','<leader>ao',  '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>', opts)
-- Diagnostics vim.api.nvim_set_keymapping
vim.api.nvim_set_keymap('n','<leader>ee', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
vim.api.nvim_set_keymap('n','<leader>en', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n','<leader>ep', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)

vim.api.nvim_set_keymap('n', [[<leader>ai]], [[<Cmd>lua require'jdtls'.organize_imports()<CR>]], opts)
vim.api.nvim_set_keymap('n', [[<leader>av]], [[<Cmd>lua require('jdtls').extract_variable()<CR>]], opts)
vim.api.nvim_set_keymap('v', [[<leader>av]], [[<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>]], opts)
vim.api.nvim_set_keymap('v', [[<leader>am]], [[<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>]], opts)
vim.api.nvim_set_keymap('n', [[<leader>aR]], [[<Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>]], opts)


vim.api.nvim_exec(
    [[
    nnoremap <silent> <leader>dc :lua require'dap'.continue()<CR>
    nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
    nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
    nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
    nnoremap <silent> <leader>dt :lua require'dap'.toggle_breakpoint()<CR>
    nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
    nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
    nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
    nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
    ]], false)
