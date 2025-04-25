local M = {}

M.setup = function()
    vim.cmd([[
  highlight Normal guibg=none
  highlight NormalNC guibg=none
  highlight SignColumn guibg=none
  highlight VertSplit guibg=none
  highlight StatusLine guibg=none
  highlight LineNr guibg=none
  highlight NonText guibg=none
  
  highlight TreeSitterContext guibg=none
  highlight TreeSitterContextLineNumber guibg=none

  highlight NvimTreeNormal guibg=none
  highlight NvimTreeNormalNC guibg=none
  highlight NvimTreeEndOfBuffer guibg=none
]])
end

return M
