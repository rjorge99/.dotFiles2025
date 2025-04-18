return {
    "nvimdev/lspsaga.nvim",
    config = function()
        require("lspsaga").setup({
            finder = {
                keys = {
                    toggle_or_open = "<cr>",
                },
            },
        })
    end,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
}
