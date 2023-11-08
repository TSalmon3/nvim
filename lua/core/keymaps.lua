vim.g.mapleader = ','

local opts = { noremap = true }
--
-- Basic Keymap
--
vim.keymap.set('n', '<leader>ev', ':vsplit $MYVIMRC<cr>', opts)
vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<cr>', opts)

-- mode switch
vim.keymap.set('i', 'jk', '<esc>', opts)
vim.keymap.set('v', 'q', '<esc>', opts)
-- vim.keymap.set('v', 'jk', '<esc>', opts)

-- window split
vim.keymap.set('n', 'sv', '<c-w>v', opts)
vim.keymap.set('n', 'sh', '<c-w>s', opts)
vim.keymap.set('n', 'sc', ':quit<cr>', opts)
-- window toggle
vim.keymap.set('n', '<m-h>', '<c-w>h', opts)
vim.keymap.set('n', '<m-j>', '<c-w>j', opts)
vim.keymap.set('n', '<m-k>', '<c-w>k', opts)
vim.keymap.set('n', '<m-l>', '<c-w>l', opts)

-- windows resize
vim.keymap.set('n', '<c-h>', ':vertical resize -2<cr>', opts)
vim.keymap.set('n', '<c-l>', ':vertical resize +2<cr>', opts)
vim.keymap.set('n', '<c-k>', 'resize -2<cr>', opts)
vim.keymap.set('n', '<c-j>', 'resize +2<cr>', opts)

--
-- Plugin Keymap
--
