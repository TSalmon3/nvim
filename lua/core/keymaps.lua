vim.g.mapleader = " "

local opts = {noremap = true}

local keymap = vim.keymap

--
-- Basic Keymap
--

-- mode switch
keymap.set("i", "jk", "<esc>", opts)
keymap.set("v", "jk", "<esc>", opts)

-- window split
keymap.set("n", "sv", "<c-w>v", opts)
keymap.set("n", "sh", "<c-w>s", opts)
keymap.set("n", "sc", ":quit<cr>", opts)
-- window toggle
keymap.set("n", "<a-h>", "<c-w>h", opts)
keymap.set("n", "<a-j>", "<c-w>j", opts)
keymap.set("n", "<a-k>", "<c-w>k", opts)
keymap.set("n", "<a-l>", "<c-w>l", opts)

--
-- Plugin Keymap
--

-- File explorer
keymap.set("n", "te", ":NvimTreeToggle<cr>", opts) 

-- Fuzzy Find
keymap.set("n", "<a-p>", ":Telescope find_files<cr>", opts)
keymap.set("n", "<a-f>", ":Telescope live_grep<cr>", opts)


-- Motion
keymap.set("n", "m", "", opts)
keymap.set("n", "mw", ":HopWord<CR>", opts)
keymap.set("n", "mc", ":HopChar1<CR>", opts)
keymap.set("n", "mC", ":HopChar2<CR>", opts)
keymap.set("n", "ml", ":HopLineStart<CR>", opts)
keymap.set("n", "mL", ":HopLine<CR>", opts)
keymap.set("n", "ma", ":HopAnywhere<CR>", opts)
