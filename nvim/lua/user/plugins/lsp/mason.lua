return {
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            -- list of servers for mason to install
            ensure_installed = {
                "ts_ls",
                "html",
                "cssls",
                "cssmodules_ls",
                "tailwindcss",
                "svelte",
                "lua_ls",
                "graphql",
                "emmet_ls",
                "prismals",
                "pyright",
                "jsonls",
                "bashls",
                "ansiblels",
                "dockerls",
                "docker_compose_language_service",
                "vue_ls",
                "yamlls",
                "eslint",
            },
        },
        dependencies = {
            {
                "williamboman/mason.nvim",
                opts = {
                    ui = {
                        icons = {
                            package_installed = "✓",
                            package_pending = "➜",
                            package_uninstalled = "✗",
                        },
                    },
                },
            },
            "neovim/nvim-lspconfig",
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = {
                "prettier",
                "stylua",
                -- "eslint_d",  instalar manual:   MasonInstall eslint_d@13.1.2
                "shfmt", -- format bash scripts
            },
        },
        dependencies = {
            "williamboman/mason.nvim",
        },
    },
}
