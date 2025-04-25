return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "folke/neodev.nvim",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        require("neodev").setup({
            library = {
                enabled = true,
                runtime = true,
                types = true,
                plugins = true,
            },
        })

        local keymap = vim.keymap

        local opts = { noremap = true, silent = true }
        local on_attach = function(_, bufnr)
            opts.buffer = bufnr

            opts.desc = "[G]oto [R]eferences"
            keymap.set("n", "gr", "<cmd>Lspsaga finder<CR>", opts)
            -- keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

            vim.keymap.set("n", "<leader>fq", function()
                local clients = vim.lsp.get_clients({ bufnr = 0 })
                if #clients == 0 then
                    vim.notify("No LSP clients active", vim.log.levels.WARN)
                    return
                end

                local client = clients[1]
                local offset_encoding = client.offset_encoding or "utf-8"
                local params = vim.lsp.util.make_position_params(0, offset_encoding)

                vim.lsp.buf_request(0, "textDocument/references", params, function(err, result, _, _)
                    if err or not result then
                        return
                    end

                    local items = vim.lsp.util.locations_to_items(result, client.offset_encoding)
                    vim.fn.setqflist({}, " ", {
                        title = "LSP References",
                        items = items,
                    })
                    vim.cmd("copen")
                end)
            end, { desc = "LSP references to Quickfix" })

            opts.desc = "[G]oto peek [D]efinition"
            keymap.set("n", "gD", "<cmd>Lspsaga peek_definition<CR>", opts)

            opts.desc = "[G]oto [d]efinition"
            keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

            opts.desc = "[G]oto [I]mplementation"
            keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

            opts.desc = "[G]oto [T]ype Definition"
            keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

            opts.desc = "See available [C]ode [A]ctions"
            keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)

            opts.desc = "[R]e[n]ame"
            keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

            opts.desc = "Show line [D]iagnostics"
            keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

            opts.desc = "Show line [d]iagnostics in floating window"
            keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

            opts.desc = "Go to previous diagnostic"
            keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)

            opts.desc = "Go to next diagnostic"
            keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

            opts.desc = "Show documentation for what is under cursor"
            keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

            opts.desc = "Restart LSP"
            keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
        end

        local capabilities = cmp_nvim_lsp.default_capabilities()

        lspconfig["html"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["ts_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
        })

        lspconfig["csharp_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["cssls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["cssmodules_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["prismals"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["graphql"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
        })

        lspconfig["volar"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
            init_options = {
                vue = {
                    hybridMode = false,
                },
                typescript = {
                    tsdk = vim.fn.stdpath("data") .. "/mason/packages/vue-language-server/node_modules/typescript/lib/",
                },
            },
        })

        lspconfig["bashls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "sh" },
        })

        lspconfig["docker_compose_language_service"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "yaml", "yml" },
        })

        lspconfig["emmet_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
        })

        lspconfig["pyright"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            -- settings = {
            --     Lua = {
            --         telemetry = { enable = false },
            --         diagnostics = { globals = { "vim" } },
            --         workspace = {
            --             checkThirdParty = false,
            --             library = {
            --                 [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            --                 [vim.fn.stdpath("config") .. "/lua"] = true,
            --             },
            --         },
            --     },
            -- },
        })

        lspconfig["rust_analyzer"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = { "rustup", "run", "stable", "rust-analyzer" },
        })

        -- Shows diagnostics in virtual_text
        vim.diagnostic.config({
            virtual_text = true,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.INFO] = "󰠠",
                    [vim.diagnostic.severity.HINT] = "",
                },
            },
        })
    end,
}
