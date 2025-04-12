-- Maximizes and restores current window
return {
    "szw/vim-maximizer",
    keys = {
        { "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
    },
}
