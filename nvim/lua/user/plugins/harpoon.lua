-- return {
--     "ThePrimeagen/harpoon",
--     event = { "BufReadPre", "BufNewFile" },
--     config = function()
--         local keymap = vim.keymap.set
--
--         local opts = { noremap = true, silent = true }
--
--         keymap("n", "<leader>hu", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
--         keymap("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>", opts)
--         keymap("n", "<C-h>", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", opts)
--         keymap("n", "<C-t>", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", opts)
--         keymap("n", "<C-n>", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", opts)
--         keymap("n", "<C-s>", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", opts)
--     end,
-- }

return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        local keymap = vim.keymap.set

        keymap("n", "<leader>ha", function()
            harpoon:list():add()
        end)
        keymap("n", "<leader>hu", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)

        local opts = { noremap = true, silent = true }
        keymap("n", "<C-h>", function()
            harpoon:list():select(1)
        end, opts)

        keymap("n", "<C-t>", function()
            harpoon:list():select(2)
        end)
        keymap("n", "<C-n>", function()
            harpoon:list():select(3)
        end)
        keymap("n", "<C-s>", function()
            harpoon:list():select(4)
        end)

        -- Toggle previous & next buffers stored within Harpoon list
        keymap("n", "<C-S-P>", function()
            harpoon:list():prev()
        end)
        keymap("n", "<C-S-N>", function()
            harpoon:list():next()
        end)
    end,
}
