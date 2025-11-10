return {
    "echasnovski/mini.files",
    enabled = false,
    config = function()
        require("mini.files").setup({
            mappings = {
                synchronize = "s",
                go_in_plus = "<CR>",
            },
        })

        -- vim.keymap.set("n", "<leader>e", function()
        --     MiniFiles.open()
        -- end, { noremap = true, desc = "Show MiniFiles" })
    end,
}
