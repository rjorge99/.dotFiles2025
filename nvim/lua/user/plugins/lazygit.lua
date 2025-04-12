return {
    "kdheepak/lazygit.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local keymap = vim.keymap.set

        vim.g.lazygit_floating_window_scaling_factor = 1

        keymap("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
    end,
}
