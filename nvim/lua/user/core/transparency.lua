local M = {}

M.setup = function()
    vim.cmd([[
  highlight Normal guibg=none
  highlight NormalNC guibg=none
  highlight SignColumn guibg=none
  highlight VertSplit guibg=none
]])
end

return M
