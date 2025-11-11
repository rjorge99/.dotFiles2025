return {
    enabled = false,
    "goolord/alpha-nvim",
    -- dependencies = { 'echasnovski/mini.icons' },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local dashboard = require("alpha.themes.dashboard")
        local alpha = require("alpha")

        dashboard.section.header.val = {
            "                                                     ",
            "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            "                                                     ",
        }

        -- dashboard.section.header.val = {
        --     " █████╗ ██╗     ██████╗ ██╗  ██╗ █████╗     ███████╗██████╗ ██████╗ ",
        --     "██╔══██╗██║     ██╔══██╗██║  ██║██╔══██╗    ██╔════╝██╔══██╗██╔══██╗",
        --     "███████║██║     ██████╔╝███████║███████║    █████╗  ██████╔╝██████╔╝",
        --     "██╔══██║██║     ██╔═══╝ ██╔══██║██╔══██║    ██╔══╝  ██╔══██╗██╔═══╝ ",
        --     "██║  ██║███████╗██║     ██║  ██║██║  ██║    ███████╗██║  ██║██║     ",
        --     "╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝    ╚══════╝╚═╝  ╚═╝╚═╝     ",
        -- }

        dashboard.section.buttons.val = {
            dashboard.button("e", " New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("p", " Projects", ":Telescope projects<CR>"),
            dashboard.button("r", " Recent", ":Telescope oldfiles<CR>"),
            dashboard.button("s", " Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
            dashboard.button("h", " Help", ":help<CR>"),
            dashboard.button("q", " Quit", ":qa<CR>"),
        }

        alpha.setup(dashboard.opts)
    end,
}
