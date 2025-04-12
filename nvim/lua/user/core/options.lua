local opt = vim.opt

-- line numbers
opt.relativenumber = true -- set relative numbered lines
opt.number = true         -- set numbered lines

-- tabs & indentation
opt.tabstop = 4       -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 4    -- 4 spaces for indent width
opt.expandtab = true  -- expand tab to spaces
opt.autoindent = true -- indent based on file type

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case in search patterns
opt.smartcase = true  -- smart case
opt.hlsearch = true   -- highlight all matches on previous search pattern
opt.incsearch = true  -- incremental search

-- cursor line
opt.cursorline = true -- highlight the current line

-- appearance
opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.g.nvcode_termcolors = 256
-- opt.background = "dark"
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time


-- backspace
opt.backspace = "indent,eol,start" -- make backspace in insert mode behave as in most other editors

-- clipboard
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard

-- split windows
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window

opt.iskeyword:append("-")

-- others
opt.backup = false                          -- creates a backup file
opt.cmdheight = 1                           -- more space in the neovim command line for displaying messages
opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
opt.conceallevel = 0                        -- so that `` is visible in markdown files
opt.fileencoding = "utf-8"                  -- the encoding written to a file
opt.mouse = "a"                             -- allow the mouse to be used in neovim
opt.pumheight = 10                          -- pop up menu height
opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
opt.showtabline = 0                         -- always show tabs
opt.smartindent = true                      -- make indenting smarter again
opt.swapfile = false                        -- creates a swapfile
opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true                         -- enable persistent undo
opt.updatetime = 300                        -- faster completion (4000ms default)
opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.laststatus = 3                          -- global statusline
opt.showcmd = false                         -- hide (partial) command in the last line of the screen
opt.ruler = false                           -- hide the line and column number of the cursor position
opt.numberwidth = 4                         -- set number column width to 2 {default 4}
opt.scrolloff = 8                           -- is one of my fav
opt.sidescrolloff = 8                       -- is one of my fav
opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications
opt.fillchars.eob = " "                     -- show empty newlines at the end of a buffer
opt.shortmess:append("c")                   -- hide all the completion messages
opt.whichwrap:append("<,>,[,],h,l")         -- move vertically by visual line

opt.foldlevel = 100
opt.foldmethod = "indent"
