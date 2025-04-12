-- Used for autocompletion
return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",           -- source for text in buffer
        "hrsh7th/cmp-path",             -- source for file system paths
        "hrsh7th/cmp-cmdline",          -- source for vim's cmdline
        "onsails/lspkind.nvim",         -- vs-code like pictograms
        "L3MON4D3/LuaSnip",             -- snippet engine
        "saadparwaiz1/cmp_luasnip",     -- for autocompletion
        "rafamadriz/friendly-snippets", -- useful snippets
        "roobert/tailwindcss-colorizer-cmp.nvim",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()
        --require("luasnip/loaders/from_vscode").lazy_load({ paths = { "./snippets" } })

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },
            snippet = { -- configure how nvim-cmp interacts with snippet engine
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.scroll_docs(-4),
                ["<C-j>"] = cmp.mapping.scroll_docs(4),
                ["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                ["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
                ["<C-Space>"] = cmp.mapping.complete(),     -- show completion suggestions
                ["<C-e>"] = cmp.mapping.abort(),            -- close completion window
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
            -- sources for autocompletion
            sources = cmp.config.sources({
                { name = "nvim_lsp" }, -- lsp
                { name = "buffer" },   -- text within current buffer
                { name = "path" },     -- file system paths
                { name = "luasnip" },  -- snippets
            }),
            formatting = {
                fields = { "abbr", "kind", "menu" },
                format = lspkind.cmp_format({
                    mode = "symbol_text", -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
                    maxwidth = 50,        -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                    menu = {              -- showing type in menu
                        nvim_lsp = "[LSP]",
                        path = "[Path]",
                        buffer = "[Buffer]",
                        luasnip = "[LuaSnip]",
                    },
                    before = require("tailwindcss-colorizer-cmp").formatter,
                }),
            },
        })

        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
        })
    end,
}
