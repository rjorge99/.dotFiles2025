---@diagnostic disable: missing-fields
return {

    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/nvim-treesitter-context",
        "nvim-treesitter/playground",
        "windwp/nvim-ts-autotag",
        -- "p00f/nvim-ts-rainbow",
    },
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            ensure_installed = {
                "json",
                "javascript",
                "typescript",
                "tsx",
                "yaml",
                "html",
                "css",
                "prisma",
                "markdown",
                "markdown_inline",
                "svelte",
                "graphql",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
                "query",
                "vimdoc",
                "tsx",
                "vue",
                "c_sharp",
            },
            highlight = { enable = true },
            indent = { enable = true },
            -- autotag = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",
                        ["ac"] = "@conditional.outer",
                        ["ic"] = "@conditional.inner",
                        ["ab"] = "@block.outer",
                        ["ib"] = "@block.inner",
                    },
                },
            },
            -- rainbow = {
            --   enable = true,
            --   disable = { "html" },
            --   extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
            --   max_file_lines = nil, -- Do not enable for files with more than n lines, int
            --   colors = {
            --     "#ffd580",
            --     "#c3a6ff",
            --     "#ffae57",
            --     "#bae67e",
            --   },
            -- },
        })

        require("ts_context_commentstring").setup({})

        -- -- Configure nvcode-color-schemes
        -- vim.g.nvcode_termcolors = 256

        -- -- Enable syntax highlighting
        -- vim.cmd("syntax on")

        -- -- Set colorscheme
        -- vim.cmd("colorscheme nvcode") -- or whatever colorscheme you use

        -- -- Enable true color if supported
        -- if vim.fn.has("termguicolors") == 1 then
        --   vim.opt.termguicolors = true
        --   vim.cmd("highlight LineNr ctermbg=NONE guibg=NONE")
        -- end
    end,
}
