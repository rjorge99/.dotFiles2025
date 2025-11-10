return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "mason-org/mason-lspconfig.nvim",
        -- {
        --     "folke/neodev.nvim",
        --     opts = {},
        -- },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap
        local opts = { noremap = true, silent = true }

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
               
            end,
        })

        local capabilities = cmp_nvim_lsp.default_capabilities()
        local on_attach = function(_, bufnr)
            opts.buffer = bufnr
        end

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
    end,
}

-- lspconfig["html"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
-- })
--
-- lspconfig["ts_ls"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
--     filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
-- })
--
-- lspconfig["csharp_ls"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
-- })
--
-- lspconfig["cssls"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
-- })
--
-- lspconfig["cssmodules_ls"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
-- })
--
-- lspconfig["prismals"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
-- })
--
-- lspconfig["graphql"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
--     filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
-- })
--
--
-- lspconfig["bashls"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
--     filetypes = { "sh" },
-- })
--
-- lspconfig["docker_compose_language_service"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
--     filetypes = { "yaml", "yml" },
-- })
--
-- lspconfig["emmet_ls"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
--     filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
-- })
--
-- lspconfig["pyright"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
-- })
--
--
-- lspconfig["rust_analyzer"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
--     cmd = { "rustup", "run", "stable", "rust-analyzer" },
-- })
