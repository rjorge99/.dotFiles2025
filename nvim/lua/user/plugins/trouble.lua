return {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
        require("trouble").setup({})

        local keymap = vim.keymap
        keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble Toggle" })
    end,
}
