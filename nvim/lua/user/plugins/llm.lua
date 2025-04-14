return {
    "huggingface/llm.nvim",
    opts = {},
    config = function()
        local llm = require("llm")
        llm.setup({
            backend = "ollama",
            model = "qwen2.5-coder:1.5b-base",
            url = "http://localhost:11434", -- llm-ls uses "/api/generate"
            accept_keymap = "<S-Tab>",
            dismiss_keymap = "<Esc>",
            -- prompts = {
            --     completion = {
            --         prompt = "Completa el siguiente código. Solo responde con el código sin usar markdown ni explicaciones:",
            --     },
            -- },
            request_body = {
                options = {
                    --                     "temperature": 0.2,
                    -- "topP": 0.15,
                    -- "topK": 5,
                    -- "presencePenalty": 0.1,
                    -- "frequencyPenalty": 0.1,
                    -- "stop": ["; ", "} "],
                    -- "maxTokens": 200
                    temperature = 0.2,
                    top_p = 0.95,
                },
            },
        })
    end,
}
