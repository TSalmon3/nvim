-- vim.api.nvim_set_keymap('mode', 'key', 'map', 'option') --
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
local pluginKeys = {}


-- ESC --
map("i", "jk", "<ESC>", opt)
map("v", "jk", "<ESC>", opt)


-- open explore --
map("n", "<leader>e", "Lex 30<CR>", opt)

-- window spilt shortcut begin--
map("n", "s", "", opt)
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
map("n", "sc", "<C-w>c", opt)
map("n", "so", "<C-w>o", opt)

-- fast switch window --
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- window resize --	
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)

map("n", "<T-m>", ":vertical resize -2<CR>", opt)
map("n", "<T-,>", ":vertical resize +2<CR>", opt)
map("n", "<T-.>", ":resize -2<CR>", opt)
map("n", "<T-/>", ":resize +2<CR>", opt)

-- navigate buffer --
map("n", "<S-l>", ":bnext<CR>", opt)
map("n", "<S-h>", ":bprevious<CR>", opt)

-- terminal --
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("n", "s=", "<C-W>=", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l]], opt)

-- move text up dan down --
map("x", "<A-j>", ":move '>+1<CR>gv-gv", opt)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", opt)

-- cursor move --
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
map("n", "<C-d>", "9j", opt)
map("n", "<C-u>", "9k", opt)


-- fast indent --
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- fast exit --
map("n", "q", "", opt)
map("n", "q", ":q<CR>", opt)
map("n", "q!", ":q!<CR>", opt)
map("n", "Q", ":qa!<CR>", opt)
