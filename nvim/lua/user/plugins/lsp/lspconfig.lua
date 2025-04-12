return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        -- { "antosha417/nvim-lsp-file-operations", config = true }, -- TODO: Check how it works
        "folke/neodev.nvim",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        require("neodev").setup({
            library = {
                enabled = true, -- habilita la biblioteca de Neovim
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
            keymap.set("n", "gr", "<cmd>Lspsaga finder<CR>", opts) -- show definition, references
            -- keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

            vim.keymap.set("n", "<leader>fq", function()
                local clients = vim.lsp.get_clients({ bufnr = 0 })
                if #clients == 0 then
                    vim.notify("No LSP clients active", vim.log.levels.WARN)
                    return
                end

                local client = clients[1] -- Podrías iterar si querés algo más robusto
                local params = vim.lsp.util.make_position_params(0, client.offset_encoding or "utf-16")

                vim.lsp.buf_request(0, "textDocument/references", params, function(err, result, _, _)
                    if err or not result then
                        return
                    end

                    local items = vim.lsp.util.locations_to_items(result, client.offset_encoding or "utf-16")
                    vim.fn.setqflist({}, " ", {
                        title = "LSP References",
                        items = items,
                    })
                    vim.cmd("copen")
                end)
            end, { desc = "LSP references to Quickfix" })

            opts.desc = "[G]oto peek [D]efinition"
            keymap.set("n", "gD", "<cmd>Lspsaga peek_definition<CR>", opts) -- Peek definition

            opts.desc = "[G]oto [d]efinition"
            keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

            opts.desc = "[G]oto [I]mplementation"
            keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

            opts.desc = "[G]oto [T]ype Definition"
            keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

            opts.desc = "See available [C]ode [A]ctions"
            keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions

            opts.desc = "[R]e[n]ame"
            keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

            opts.desc = "Show line [D]iagnostics"
            keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line

            opts.desc = "Show line [d]iagnostics in floating window"
            keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

            opts.desc = "Go to previous diagnostic"
            keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer

            opts.desc = "Go to next diagnostic"
            keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer

            opts.desc = "Show documentation for what is under cursor"
            keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor

            opts.desc = "Restart LSP"
            keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
        end

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- configure html server
        lspconfig["html"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure typescript server with plugin
        lspconfig["ts_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
            -- init_options = {
            --     plugins = {
            --         {
            --             name = '@vue/typescript-plugin',
            --             location = vim.fn.stdpath 'data' ..
            --                 '/mason/packages/vue-language-server/node_modules/@vue/language-server',
            --             languages = { 'vue' },
            --         },
            --     },
            -- },
        })

        -- configure css server
        lspconfig["cssls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["cssmodules_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure prisma orm server
        lspconfig["prismals"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure graphql language server
        lspconfig["graphql"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
        })

        -- configure vue server
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

        -- configure emmet language server
        lspconfig["emmet_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
        })

        -- configure python server
        lspconfig["pyright"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = { -- custom settings for lua
                Lua = {
                    telemetry = { enable = false },
                    diagnostics = { globals = { "vim" } },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })

        lspconfig["rust_analyzer"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = { "rustup", "run", "stable", "rust-analyzer" },
        })

        -- Muestra visualmente los errores
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
