return {
    {
        "bluz71/vim-nightfly-guicolors",
        prority = 1000,
        lazy = true,
        enabled = false,
        config = function()
            --vim.cmd([[colorscheme nightfly]])
        end,
    },
    {
        "Mofiqul/vscode.nvim",
        priority = 1000,
        enabled = false,
        lazy = true,
        config = function()
            -- vim.cmd([[colorscheme vscode]])
        end,
    },
    {
        "rjorge99/halcyon-neovim",
        priority = 1000,
        enabled = false,
        lazy = true,
        config = function()
            -- vim.cmd([[colorscheme halcyon]])
        end,
    },
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        enabled = false,
        lazy = true,
        config = function()
            --    vim.cmd([[colorscheme tokyonight]])
        end,
    },
    {
        "rose-pine/neovim",
        priority = 1000,
        enabled = false,
        lazy = true,
        config = function()
            -- vim.cmd([[colorscheme rose-pine-main]])
        end,
    },
    {
        "catppuccin/nvim",
        priority = 1000,
        enabled = false,
        lazy = true,
        config = function()
            -- vim.cmd([[colorscheme catppuccin-mocha]])
        end,
    },
    {
        "Shatur/neovim-ayu",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("ayu-dark")
            vim.api.nvim_set_hl(0, "Visual", { bg = "#3e4452", fg = "NONE" })
        end,
    },
    {
        "samharju/synthweave.nvim",
        enabled = false,
        lazy = true,
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme("synthweave")
            -- transparent version
            -- vim.cmd.colorscheme("synthweave-transparent")
        end,
    },
}
