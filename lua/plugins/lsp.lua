-- lua/plugins/lsp.lua
return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            -- Global enable (merge with existing)
            opts.inlay_hints = vim.tbl_deep_extend("force", opts.inlay_hints or {}, {
                enabled = true,
                exclude = {}, -- Remove defaults like "vue" to enable for all filetypes
            })

            -- Server-specific settings (add/merge)
            opts.servers = vim.tbl_deep_extend("force", opts.servers or {}, {
                -- Rust (rust-analyzer defaults to providing hints)
                rust_analyzer = {
                    settings = {
                        ["rust-analyzer"] = {
                            inlayHints = {
                                enable = true, -- Explicit for safety
                                chainingHints = { enable = true },
                                parameterHints = { enable = true },
                                typeHints = { enable = true },
                            },
                        },
                    },
                },

                -- Zig (zls)
                zls = {
                    settings = {
                        inlay_hints = true, -- zls supports basic hints
                    },
                },

                -- JavaScript/TypeScript/Svelte (ts_ls for JS/TS/Svelte)
                ts_ls = {
                    settings = {
                        typescript = {
                            inlayHints = {
                                includeInlayEnumMemberValueHints = true,
                                includeInlayFunctionLikeReturnTypeHints = true,
                                includeInlayFunctionParameterTypeHints = true,
                                includeInlayParameterNameHints = "all",
                                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                                includeInlayPropertyDeclarationTypeHints = true,
                                includeInlayVariableTypeHints = true,
                            },
                        },
                        javascript = { -- Same for JS
                            inlayHints = {
                                includeInlayEnumMemberValueHints = true,
                                includeInlayFunctionLikeReturnTypeHints = true,
                                includeInlayFunctionParameterTypeHints = true,
                                includeInlayParameterNameHints = "all",
                                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                                includeInlayPropertyDeclarationTypeHints = true,
                                includeInlayVariableTypeHints = true,
                            },
                        },
                    },
                },
                svelte = { -- Svelte uses TS under the hood
                    settings = {
                        svelte = {
                            plugin = {
                                svelte = {
                                    inlayHints = true,
                                },
                            },
                        },
                    },
                },

                -- Lua (lua_ls)
                lua_ls = {
                    settings = {
                        Lua = {
                            hint = {
                                enable = true,
                                arrayIndex = "Auto",
                                paramName = "All",
                                paramType = true,
                                semicolon = "SameLine",
                                setType = true,
                            },
                        },
                    },
                },

                -- CSS/HTML (limited hints, but enable if supported)
                cssls = {
                    settings = {
                        css = {
                            lint = { unknownAtRules = "ignore" }, -- Basic; hints are minimal
                        },
                    },
                },
                html = {
                    settings = {
                        html = {
                            -- HTML has no true inlay hints; relies on validation
                        },
                    },
                },
            })

            return opts
        end,
    },
}
