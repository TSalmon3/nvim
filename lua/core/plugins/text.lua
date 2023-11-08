local text = {}

table.insert(text, {
    'kana/vim-textobj-function',
    lazy = true,
    event = 'BufReadPost',
    dependencies = {
        { 'kana/vim-textobj-user' },
    },
})

table.insert(text, {
    'sgur/vim-textobj-parameter',
    lazy = true,
    event = 'BufReadPost',
    dependencies = {
        { 'kana/vim-textobj-user' },
    },
    config = function()
        vim.cmd([[let g:vim_textobj_parameter_mapping = ',']])
    end,
})

table.insert(text, {
    'kana/vim-textobj-indent',
    lazy = true,
    event = 'BufReadPost',
    dependencies = {
        { 'kana/vim-textobj-user' },
    },
})

table.insert(text, {
    lazy = true,
    event = 'BufReadPost',
    'kana/vim-textobj-syntax',
    dependencies = {
        { 'kana/vim-textobj-user' },
    },
})

table.insert(text, {
    lazy = true,
    event = 'BufReadPost',
    'kana/vim-textobj-line',
    dependencies = {
        { 'kana/vim-textobj-user' },
    },
})

table.insert(text, {
    'lukas-reineke/indent-blankline.nvim',
    lazy = true,
    main = 'ibl',
    event = 'BufReadPost',
    config = require('plugins.text.indentline.config'),
})

table.insert(text, {
    'windwp/nvim-autopairs',
    lazy = true,
    event = 'BufReadPost',
    config = require('plugins.text.autopairs.config'),
})

table.insert(text, {
    'kylechui/nvim-surround',
    lazy = true,
    event = 'BufReadPost',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    config = require('plugins.text.surround.config'),
})

table.insert(text, {
    'phaazon/hop.nvim',
    lazy = true,
    event = 'BufReadPost',
    branch = 'v2', -- optional but strongly recommended
    config = require('plugins.text.hop.config'),
    keys = require('plugins.text.hop.keys'),
})

table.insert(text, {
    'rainbowhxch/accelerated-jk.nvim',
    lazy = true,
    event = 'VeryLazy',
    config = require('plugins.text.accelerated-js.config'),
    keys = require('plugins.text.accelerated-js.keys'),
})

table.insert(text, {
    'mg979/vim-visual-multi',
    lazy = true,
    event = 'BufReadPost',
    config = require('plugins.text.vim-visual-multi.config'),

    dependencies = {
        'kevinhwang91/nvim-hlslens',
        lazy = true,
        config = require('plugins.text.nvim-hlslens.config'),
        keys = require('plugins.text.nvim-hlslens.keys'),
    },
})

table.insert(text, {
    'norcalli/nvim-colorizer.lua',
    lazy = true,
    event = 'BufReadPost',
    config = function()
        require('colorizer').setup()
    end,
})

return text
