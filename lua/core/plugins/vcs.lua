-- version control system
--
--

local vcs = {}

table.insert(vcs, {
    'tpope/vim-fugitive',
    lazy = false,
    dependencies = {
        { 'junegunn/gv.vim' },
    },
})

-- gitsigns
table.insert(vcs, {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
    config = require('plugins.vcs.gitsigns.config'),
    keys = require('plugins.vcs.gitsigns.keys'),
})

table.insert(vcs, {
    'sindrets/diffview.nvim',
    lazy = true,
    cmd = { 'DiffviewOpen', 'DiffviewClose' },
    dependencies = 'nvim-lua/plenary.nvim',
    keys = require('plugins.vcs.diffview.keys'),
})

table.insert(vcs, {
    'TimUntersberger/neogit',
    enabled = true,
    config = require('plugins.vcs..neogit.config'),
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
    },
})

return vcs
