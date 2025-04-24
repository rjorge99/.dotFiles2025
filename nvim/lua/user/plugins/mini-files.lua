return {
    "echasnovski/mini.files",
    config = function()
        require("mini.files").setup({
            mappings = {
                synchronize = "s",
                go_in_plus = "<CR>",
            },
        })

        vim.keymap.set(
            "n",
            "<leader>e",
            ":lua MiniFiles.open()<CR>",
            { noremap = true, silent = true, desc = "Show MiniFiles" }
        )
    end,
}
