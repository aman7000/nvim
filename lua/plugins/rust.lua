-- lua/plugins/rust.lua
return {
    {
        "mrcjkb/rustaceanvim",
        version = "^5", -- Recommended to pin version; update as needed
        opts = function(_, opts)
            local bufnr = vim.api.nvim_get_current_buf()
            opts.server = vim.tbl_deep_extend("force", opts.server or {}, {
                on_attach = function(client, bufnr)
                    -- Enable inlay hints for this buffer
                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                end,
            })
            return opts
        end,
    },
}
