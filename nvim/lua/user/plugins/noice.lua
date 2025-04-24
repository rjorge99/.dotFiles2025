return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        local noice = require("noice")

        -- Requerido por el detalle de transparencia
        require("notify").setup({
            background_colour = "#1e1e2e",
        })

        noice.setup({
            routes = {
                {
                    filter = {
                        event = "notify",
                        find = "nil",
                    },
                    opts = { skip = true },
                },
                {
                    filter = {
                        event = "notify",
                        find = "No information available",
                    },
                    opts = { skip = true },
                },
                {
                    filter = {
                        event = "notify",
                        find = "created",
                    },
                    opts = { skip = true },
                },
                {
                    filter = {
                        event = "notify",
                        find = "removed",
                    },
                    opts = { skip = true },
                },
            },
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
            },
            messages = {
                enabled = false,
                view_warn = "cmdline",
            },
        })
    end,
}
