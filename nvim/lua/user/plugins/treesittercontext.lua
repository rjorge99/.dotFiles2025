return {
   "nvim-treesitter/nvim-treesitter-context",
   event = { "BufReadPre", "BufNewFile" },
   config = function()
      require("treesitter-context").setup({
         enable = true,
         max_lines = 0,
         trim_scope = "outer",
         min_window_height = 0,
         patterns = {
            default = {
               "class",
               "function",
               "method",
            },
         },
      })
   end
}
