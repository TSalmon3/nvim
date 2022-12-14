-- vim.api.nvim_set_keymap('mode', 'key', 'map', 'option') --
--Remap space as leader key
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

map("", "<Space>", "<Nop>", opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ESC --
map("i", "jk", "<ESC>", opt)
map("v", "jk", "<ESC>", opt)

-- open explore --
-- map("n", "<leader>e", ":Lex 30<CR>", opt)
map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)
map("n", "<A-e>", ":NvimTreeToggle<CR>", opt)

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

map("n", "<A-n>", ":vertical resize -2<CR>", opt)
map("n", "<A-.>", ":vertical resize +2<CR>", opt)
map("n", "<A-m>", ":resize -2<CR>", opt)
map("n", "<A-,>", ":resize +2<CR>", opt)

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

-- telescope --
map("n", "<A-p>", ":Telescope find_files<CR>", opt)
map("n", "<A-f>", ":Telescope live_grep<CR>", opt)

-- bufferline --
-- 1.1 table switch
map("n", "<S-h>", ":BufferLineCyclePre<CR>", opt)
map("n", "<S-l>", ":BufferLineCycleNext<CR>", opt)
-- 1.2 table close
map("n", "<A-w>", ":Bdelete!<CR>", opt)
--map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
--map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
--map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- toggleterm --
local opts = { noremap = true }
vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
vim.api.nvim_buf_set_keymap(0, "t", "<A-h>", [[<C-\><C-n><C-W>h]], opts)
vim.api.nvim_buf_set_keymap(0, "t", "<A-j>", [[<C-\><C-n><C-W>j]], opts)
vim.api.nvim_buf_set_keymap(0, "t", "<A-k>", [[<C-\><C-n><C-W>k]], opts)
vim.api.nvim_buf_set_keymap(0, "t", "<A-l>", [[<C-\><C-n><C-W>l]], opts)

-- gitsigns --
map("n", "gs", ":Gitsigns blame_line<CR>", opt)

-- lsp --
map("n", "c", "", opt)
map("n", "ff", ":Format<CR>", opt)

-- motion --
map("n", "m", "", opt)
map("n", "mw", ":HopWord<CR>", opts)
map("n", "mc", ":HopChar1<CR>", opts)
map("n", "mC", ":HopChar2<CR>", opts)
map("n", "ml", ":HopLineStart<CR>", opts)
map("n", "mL", ":HopLine<CR>", opts)
map("n", "ma", ":HopAnywhere<CR>", opts)

-- trouble --
map("n", "tt", "<cmd>TroubleToggle<cr>", opts)
map("n", "tw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
map("n", "td", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
map("n", "tr", "<cmd>TroubleRefresh<cr>", opts)

-- todo --
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
