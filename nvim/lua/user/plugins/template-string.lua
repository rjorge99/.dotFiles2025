return {
    "axelvc/template-string.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local templatestring = require("template-string")

        templatestring.setup({
            filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "python" }, -- filetypes where the plugin is active
            jsx_brackets = true,                                                                    -- must add brackets to jsx attributes
            remove_template_string = false,                                                         -- remove backticks when there are no template string
            restore_quotes = {
                normal = [[']],
                jsx = [["]],
            },
        })
    end,
}
