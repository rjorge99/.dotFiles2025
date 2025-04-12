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

        noice.setup({
            routes = {
                {
                    -- avoid annoying message
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
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
                command_palette = true, -- position the cmdline and popupmenu together
                -- long_message_to_split = false, -- long messages will be sent to a split
                -- inc_rename = false, -- enables an input dialog for inc-rename.nvim
                -- lsp_doc_border = false, -- add a border to hover docs and signature help
            },
            messages = {
                enabled = false,
                view_warn = "cmdline",
            },
        })
    end,
}
