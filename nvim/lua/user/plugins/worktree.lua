return {
    "ThePrimeagen/git-worktree.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        local worktree = require("git-worktree")
        worktree.setup()

        local keymap = vim.keymap.set

        keymap(
            "n",
            "<leader>wt",
            "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
            { desc = "Show worktree" }
        )
        keymap(
            "n",
            "<leader>wT",
            "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
            { desc = "Create worktree" }
        )
    end,
}
