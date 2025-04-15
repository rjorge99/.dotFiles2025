return {
    lazy = true,
    "huggingface/llm.nvim",
    opts = {},
    config = function()
        local llm = require("llm")
        llm.setup({
            backend = "ollama",
            model = "deepseek-coder:1.3b-base",
            url = "http://localhost:11434", -- llm-ls uses "/api/generate"
            accept_keymap = "<S-Tab>",
            dismiss_keymap = "<Esc>",
            fim = {
                enabled = true,
                prefix = "<｜fim▁begin｜>",
                suffix = "<｜fim▁hole｜>",
                middle = "<｜fim▁end｜>",
            },
            request_body = {
                -- Modelfile options for the model you use
                options = {
                    temperature = 0.2,
                    top_p = 0.95,
                },
            },
        })
    end,
}
