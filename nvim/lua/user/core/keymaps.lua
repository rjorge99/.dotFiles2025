local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts) -- set space as leader key
vim.g.mapleader = " "                -- set leader key
vim.g.maplocalleader = " "

keymap("n", "<leader><leader>s", ":w!<CR> :source %<CR>", { noremap = true, silent = true, desc = "Source file" }) -- Source file

keymap("n", "<leader>lg", ":LazyGit<CR>", { noremap = true, silent = true, desc = "LazyGit" })
keymap("n", "<leader>ss", ":w!<CR>", { noremap = true, silent = true, desc = "Save" })                                     -- save
keymap("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "Exit insert mode with jk" })                           -- exit insert mode
keymap("n", "QQ", "<cmd>:q!<CR>", { noremap = true, silent = true, desc = "Save" })                                        -- Exit
keymap("n", "<leader>nh", "<cmd>nohlsearch<CR>", { noremap = true, silent = true, desc = "Clear search highlights" })      -- clear search highlights
keymap("n", "x", '"_x', { noremap = true, silent = true, desc = "Delete single character without copying into register" }) -- delete single character without copying into register
keymap("n", "<leader>+", "<C-a>", { noremap = true, silent = true, desc = "Increment number" })                            -- increment number
keymap("n", "<leader>-", "<C-x>", { noremap = true, silent = true, desc = "Decrement number" })                            -- decrement number

-- Quickfix list
keymap("n", "<leader>j", ":cnext<CR>zz", { noremap = true, silent = true, desc = "Forward quickfix list" })
keymap("n", "<leader>k", ":cprev<CR>zz", { noremap = true, silent = true, desc = "Backward quickfix list" })

-- Buffer management
keymap("n", "<leader>bc", ":Bdelete<CR>", { noremap = true, silent = true, desc = "Close buffer" })
keymap("n", "<leader>bo", ":%bd|e#|bd#<CR>", { noremap = true, silent = true, desc = "Close all buffers" })
keymap("n", "<S-l>", ":bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
keymap("n", "<S-h>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous buffer" })

-- Window management
-- keymap("n", "<leader>sv", "<C-w>v", { noremap = true, silent = true, desc = "Split window vertically" })                 -- split window vertically
-- keymap("n", "<leader>sh", "<C-w>s", { noremap = true, silent = true, desc = "Split window horizontally" })               -- split window horizontally
-- keymap("n", "<leader>se", "<C-w>=", { noremap = true, silent = true, desc = "Make split windows equal width & height" }) -- make split windows equal width & height
-- keymap("n", "<leader>sx", ":close<CR>", { noremap = true, silent = true, desc = "Close current split window" })          -- close current split window
-- keymap("n", "<leader>wc", ":close<CR>", { noremap = true, silent = true, desc = "Close current window" })                -- close current window

keymap("n", "<C-Up>", ":resize +5<CR>", { noremap = true, silent = true, desc = "Resize up" })
keymap("n", "<C-Down>", ":resize -5<CR>", { noremap = true, silent = true, desc = "Resize down" })
keymap("n", "<C-Left>", ":vertical resize +5<CR>", { noremap = true, silent = true, desc = "Resize left" })
keymap("n", "<C-Right>", ":vertical resize -5<CR>", { noremap = true, silent = true, desc = "Resize right" })

-- Tab management
-- keymap("n", "<leader>to", ":tabnew<CR>", opts)   -- open new tab
-- keymap("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
-- keymap("n", "<leader>tn", ":tabn<CR>", opts)     -- go to next tab
-- keymap("n", "<leader>tp", ":tabp<CR>", opts)     -- go to previous tab
-- keymap("n", "<leader>tf", ":tabnew %<CR>", opts) -- move current buffer to new tab

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move selected lines down" })          -- move selected lines down
keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move selected lines up" })            -- move selected lines up

keymap("n", "J", "mzJ`z", { noremap = true, silent = true, desc = "J keeps cursor in current position" })           -- J keeps cursor in current position

keymap("v", "<leader>p", '"_dP', { noremap = true, silent = true, desc = "Paste without overwriting registerve" })  -- paste without overwriting register

keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true, desc = "Scroll down keeping cursor in center" })   -- scroll down keeping cursor in center
keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true, desc = "Scroll up keeping cursor in center" })     -- scroll up keeping cursor in center

keymap("n", "n", "nzz", { noremap = true, silent = true, desc = "Move to next search keeping word in center" })     -- move to next search keeping word in center
keymap("n", "N", "Nzz", { noremap = true, silent = true, desc = "Move to previous search keeping word in center" }) -- move to previous search keeping word in center

-- Stay in indent mode
keymap("v", "<", "<gv", { noremap = true, silent = true, desc = "Shift left" })  -- shift left
keymap("v", ">", ">gv", { noremap = true, silent = true, desc = "Shift right" }) -- shift right

----------------------
-- Plugin Keybinds --
----------------------
-- Color Picker
keymap("n", "<C-c>", "<cmd>PickColor<cr>", opts)
keymap("i", "<C-c>", "<cmd>PickColorInsert<cr>", opts)

-- Varios
-- keymap("n", "<leader><leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
-- keymap("n", "<leader><leader>s", "<cmd>HopChar1<cr>", opts)                 -- Easy motion
-- keymap("n", "<leader>br", ":%s/", opts)                                     -- Replace a word based on regular expressions
-- keymap("n", "<leader>ic", "f{a<CR><C-o>O", opts)                            -- Insert code between {}}
-- keymap("n", "<leader><leader>e", ":wq!<CR>", opts)                          -- Save and exit
-- keymap("n", "<leader>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts) -- Show function signature

-- Code run
-- keymap("n", "<leader><leader>cr", ":Lab code run<cr>", opts)
-- keymap("n", "<leader><leader>cs", ":Lab code stop<cr>", opts)

-- Vcoolor
-- <Alt-R> you can insert a rgb color anywhere (NORMAL and INSERT modes).
-- <Alt-V> you can insert a hsl color anywhere (NORMAL and INSERT modes).
-- <Alt-W> you can insert a rgba color anywhere (NORMAL and INSERT modes).

-- Markdown-Preview Plugin
-- keymap("n", "<leader>mp", ":MarkdownPreview<CR>", opts)

-- Give executon permits to current file
-- keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", opts)

-- Custom Scripts
-- keymap("n", "<C-f>", ":silent !tmux neww tmux-sessionizer<CR>", opts)
