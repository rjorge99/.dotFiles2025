return {
    {
        "olimorris/codecompanion.nvim",
        opts = {},
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("codecompanion").setup({
                adapter = "openai", -- ¡Usamos la API estilo OpenAI!
                openai = {
                    api_key = "ollama", -- cualquier valor funciona
                    base_url = "http://localhost:11434/v1", -- <== PUNTO CLAVE
                    model = "qwen2.5-coder:1.5b",
                },
            })
        end,
    },
}
