return {
  "luckasRanarison/tailwind-tools.nvim",
  name = "tailwind-tools",
  build = ":UpdateRemotePlugins",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim", -- optional
    "neovim/nvim-lspconfig",         -- optional
  },
  config = function()
    require("tailwind-tools").setup({
      -- Configuración de colores (si habilitas la funcionalidad)
      document_color = {
        enabled = true, -- Habilitar colores de documentos
        kind = "background", -- Opciones: "inline", "foreground", "background"
        inline_symbol = "󰝤 ", -- Símbolo usado en modo inline
        debounce = 200, -- Debounce en milisegundos
      },

      -- Configuración para integración con `cmp` (autocompletado)
      cmp = {
        highlight = "foreground", -- Estilo de vista previa de colores: "foreground" o "background"
      },

    })
  end -- your configuration
}
