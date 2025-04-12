return {
    "ThePrimeagen/harpoon",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local keymap = vim.keymap.set

        local opts = { noremap = true, silent = true }

        keymap("n", "<leader>hu", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
        keymap("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>", opts)
        keymap("n", "<C-h>", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", opts)
        keymap("n", "<C-t>", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", opts)
        keymap("n", "<C-n>", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", opts)
        keymap("n", "<C-s>", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", opts)
    end,
}
