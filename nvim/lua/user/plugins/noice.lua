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
        vim.lsp.set_log_level("error")
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
                signature = {
                    enabled = true,
                    auto_open = true,
                },
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                lsp_doc_border = true,
            },
            messages = {
                enabled = false,
                -- view_warn = "cmdline",
            },
            views = {
                hover = {
                    position = {
                        row = 0,
                        col = 0,
                    },
                    size = {
                        max_height = 10, -- <= documentaciones largas no cubrirán tanto
                        max_width = 80,
                    },
                    border = {
                        style = "rounded",
                    },
                },
            },
        })

        vim.keymap.set({ "n", "i", "s" }, "<C-f>", function()
            if require("noice.lsp").scroll(4) then
                return
            end
            return "<C-f>"
        end, { silent = true, expr = true, desc = "Scroll forward in noice " })

        vim.keymap.set({ "n", "i", "s" }, "<C-b>", function()
            if require("noice.lsp").scroll(-4) then
                return
            end
            return "<C-b>"
        end, { silent = true, expr = true, desc = "Scroll backward in noice " })
    end,
}
