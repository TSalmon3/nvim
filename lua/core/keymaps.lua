vim.g.mapleader = " "

local keymap = vim.keymap

--
-- Basic Keymap
--

-- mode switch
keymap.set("i", "jk", "<esc>")


-- window split
keymap.set("n", "sv", "<c-w>v")
keymap.set("n", "sh", "<c-w>s")
keymap.set("n", "sc", ":quit<cr>")
-- window toggle
keymap.set("n", "<a-h>", "<c-w>h")
keymap.set("n", "<a-j>", "<c-w>j")
keymap.set("n", "<a-k>", "<c-w>k")
keymap.set("n", "<a-l>", "<c-w>l")

--
-- Plugin Keymap
--

-- File explorer
keymap.set("n", "te", ":NvimTreeToggle<cr>") 

-- Fuzzy Find
keymap.set("n", "<a-p>", ":Telescope find_files<cr>")
keymap.set("n", "<a-f>", ":Telescope live_grep<cr>")
