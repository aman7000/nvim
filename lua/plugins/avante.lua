-- ~/.config/nvim/lua/plugins/avante.lua
return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    opts = {
        provider = "openai", -- which provider to use by default
        providers = {
            openai = {
                api_key = vim.env.OPENAI_API_KEY, -- set in your shell env
                model = "gpt-5.1", -- pick your model
                -- temperature = 0.2,               -- (optional) any extra params
            },
            -- You can configure others too and switch via :Avante provider <name>
            -- anthropic = { api_key = vim.env.ANTHROPIC_API_KEY, model = "claude-3-5-sonnet-20241022" },
            -- gemini    = { api_key = vim.env.GEMINI_API_KEY,    model = "gemini-1.5-pro" },
            -- ollama    = { model = "llama3" },  -- local LLM via Ollama
        },
    },
}
