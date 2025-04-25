return {
    event = "VeryLazy",
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "ThePrimeagen/git-worktree.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            },
        },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                -- layout_config = {
                --     preview_width = 0.6,
                -- },
                path_display = { "truncate " },
                file_ignore_patterns = {
                    "node_modules",
                    ".git/",
                    ".next/",
                    ".git\\",
                    ".next\\",
                    ".jpg",
                    ".jgp",
                    ".bmp",
                }, -- Que ignore la carpeta de nod
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                    },
                    n = {
                        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                    },
                },
            },
        })

        telescope.load_extension("fzf")
        telescope.load_extension("git_worktree")

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
        vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
        vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
        vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch [G]rep" })
        vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch curren [W]ord" })
        vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[S]earch by [B]uffer" })
    end,
}
