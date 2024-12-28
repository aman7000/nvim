return {
	{
		"stevearc/conform.nvim",
		-- event = 'BufWritePre', -- uncomment for format on save
		opts = require "configs.conform",
	},

	-- These are some examples, uncomment them if you want to see them work!
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			'simrat39/rust-tools.nvim', -- Enhanced Rust support
		},
		config = function()
			local lspconfig = require('lspconfig')
			-- Configure tsserver for JavaScript and TypeScript
			lspconfig.ts_ls.setup({
				on_attach = function(client, bufnr)
					-- Disable ts_ls formatting if using an external formatter
					client.server_capabilities.documentFormattingProvider = true

					-- Keybindings for LSP features
					local bufopts = { noremap = true, silent = true, buffer = bufnr }
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
					vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)

					-- Format on save
					if client.server_capabilities.documentFormattingProvider then
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
				settings = {
					typescript = {
						tsdk = "./node_modules/typescript/lib"
					}
				}
			})

			lspconfig.lua_ls.setup({
				on_attach = function(client, bufnr)
					-- Enable format on save
					if client.server_capabilities.documentFormattingProvider then
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
				settings = {
					Lua = {
						format = {
							enable = true,
							defaultConfig = {
								indent_style = "space",
								indent_size = "4",
							},
						},
						diagnostics = {
							globals = { "vim" }, -- Avoid warnings for Neovim-specific globals
						},
					},
				},
			})

			local rt = require("rust-tools")

			rt.setup({
				server = {
					on_attach = function(client, bufnr)
						-- Enable LSP keybindings
						local bufopts = { noremap = true, silent = true, buffer = bufnr }
						vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
						vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
						vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
						vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)

						-- Enable inlay hints
						require("lsp-inlayhints").on_attach(client, bufnr)
					end,
					settings = {
						["rust-analyzer"] = {
							inlayHints = {
								enable = true,
								typeHints = true,
								parameterHints = true,
								chainingHints = true,
								maxLength = nil,
							},
						},
					},
				},
			})
		end
	},
	{
		'hrsh7th/nvim-cmp', -- Autocompletion plugin
		dependencies = {
			'hrsh7th/cmp-nvim-lsp', -- LSP completion source
			'hrsh7th/cmp-buffer', -- Buffer completion source
			'hrsh7th/cmp-path', -- Path completion source
			'hrsh7th/cmp-vsnip', -- Snippet completion source
			'hrsh7th/vim-vsnip', -- Snippet engine
		},
		config = function()
			local cmp = require 'cmp'
			cmp.setup({
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				mapping = {
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.close(),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
				},
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'vsnip' },
				}, {
					{ name = 'buffer' },
				})
			})
		end
	},
	{
		'jose-elias-alvarez/null-ls.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local null_ls = require('null-ls')
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettier.with({
						filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "astro" },
					}),
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
			})
		end
	},
	{
		'wuelnerdotexe/vim-astro',
		ft = { 'astro' },
		config = function()
			-- Set the Astro plugin options
			vim.g.astro_typescript = 'enable'
			require "lspconfig".astro.setup({
				on_attach = function(client, bufnr)
					-- Enable formatting if the server supports it
					if client.server_capabilities.documentFormattingProvider then
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
					-- Additional keybindings for LSP (optional)
					local bufopts = { noremap = true, silent = true, buffer = bufnr }
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
					vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
				end,
				filetypes = { "astro" }, -- Ensure this is scoped to Astro files
			})
		end
	},
	{
		'simrat39/rust-tools.nvim',
		config = function()
			require("rust-tools").setup({})
		end
	},
	{
		"lvimuser/lsp-inlayhints.nvim"
	},
	{
		'mrcjkb/rustaceanvim',
		version = '^5', -- Recommended
		lazy = false, -- This plugin is already lazy
		ft = "rust",
		config = function()
			local mason_registry = require('mason-registry')
			local codelldb = mason_registry.get_package("codelldb")
			local extension_path = codelldb:get_install_path() .. "/extension/"
			local codelldb_path = extension_path .. "adapter/codelldb"
			local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
			-- If you are on Linux, replace the line above with the line below:
			-- local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
			local cfg = require('rustaceanvim.config')

			vim.g.rustaceanvim = {
				dap = {
					adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
				},
			}
		end
	},

	{
		'rust-lang/rust.vim',
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end
	},

	{
		'mfussenegger/nvim-dap',
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},

	{
		'rcarriga/nvim-dap-ui',
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			require("dapui").setup()
		end,
	},

	{
		'saecki/crates.nvim',
		ft = { "toml" },
		config = function()
			require("crates").setup {
				completion = {
					cmp = {
						enabled = true
					},
				},
			}
			require('cmp').setup.buffer({
				sources = { { name = "crates" } }
			})
		end
	},
	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	opts = {
	-- 		ensure_installed = {
	-- 			"vim", "lua", "vimdoc",
	--      "html", "css"
	-- 		},
	-- 	},
	-- },
}
