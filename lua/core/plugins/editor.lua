local editor = {}

-- colorscheme
table.insert(editor, {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd([[colorscheme tokyonight]])
    end,
    dependencies = {
        { 'olimorris/onedarkpro.nvim' },
        { 'ellisonleao/gruvbox.nvim' },
        { 'rafamadriz/neon' },
    },
})

table.insert(editor, {
    'mhinz/vim-startify',
    lazy = true,
    event = 'VimEnter',
    config = require('plugins.editor.vim-startify.config'),
    keys = require('plugins.editor.vim-startify.keys'),
})

--- explorer

table.insert(editor, {
    'ahmedkhalf/project.nvim',
    enabled = true,
    event = 'VimEnter',
    config = function()
        require('project_nvim').setup({
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            detection_methods = { 'pattern' },
            patterns = { '.git', '.root' },
        })
    end,
})

table.insert(editor, {
    'nvim-tree/nvim-tree.lua',
    lazy = true,
    cmd = {
        'NvimTreeToggle',
    },
    version = '*',
    config = require('plugins.editor.nvim-tree.config'),
    keys = require('plugins.editor.nvim-tree.keys'),
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'ahmedkhalf/project.nvim',
    },
})

--- statusline
table.insert(editor, {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
    config = require('plugins.editor.lualine.config'),
})

--- bufferline
table.insert(editor, {
    'akinsho/bufferline.nvim',
    -- lazy = true,
    -- event = { "BufReadPost", "BufAdd", "BufNewFile" },
    version = '*',
    config = require('plugins.editor.bufferline.config'),
    dependencies = { 'nvim-tree/nvim-web-devicons' },
})

-- terminal
table.insert(editor, {
    'akinsho/toggleterm.nvim',
    lazy = true,
    cmd = { 'ToggleTerm' },
    version = '*',
    config = require('plugins.editor.toggleterm.config'),
    keys = require('plugins.editor.toggleterm.keys'),
})

-- fuzzy finder

table.insert(editor, {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        -- calling `setup` is optional for customization
        require('fzf-lua').setup({})
    end,
})

table.insert(editor, {
    'rcarriga/nvim-notify',
    enabled = true,
    event = 'VimEnter',
    config = require('plugins.editor.nvim-notify.config'),
})

table.insert(editor, {
    'nvim-telescope/telescope.nvim',
    enabled = true,
    tag = '0.1.1',
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 'debugloop/telescope-undo.nvim' },
        { 'rcarriga/nvim-notify' },
        {
            'stevearc/dressing.nvim',
            enabled = false,
        },
    },
    config = require('plugins.editor.telescope.config'),
    keys = require('plugins.editor.telescope.keys'),
})

table.insert(editor, {
    'romainl/vim-cool',
    lazy = true,
    event = 'CmdlineEnter',
    config = require('plugins.editor.vim-cool.config'),
})

table.insert(editor, {
    'nvim-treesitter/nvim-treesitter',
    lazy = true,
    event = { 'BufNewFile', 'BufReadPre' },
    build = function()
        require('nvim-treesitter.install').update({ with_sync = true })
    end,
    config = require('plugins.editor.treesitter.config'),
    dependencies = {
        { 'p00f/nvim-ts-rainbow' },
        { 'nvim-treesitter/nvim-treesitter-textobjects' },
    },
})

return editor
