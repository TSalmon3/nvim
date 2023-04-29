local lang = {}

table.insert(lang, {
    'kana/vim-textobj-function',
    lazy = true,
    event = 'BufReadPost',
    dependencies = {
        { 'kana/vim-textobj-user' },
    },
})

table.insert(lang, {
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

table.insert(lang, {
    'kana/vim-textobj-indent',
    lazy = true,
    event = 'BufReadPost',
    dependencies = {
        { 'kana/vim-textobj-user' },
    },
})

table.insert(lang, {
    lazy = true,
    event = 'BufReadPost',
    'kana/vim-textobj-syntax',
    dependencies = {
        { 'kana/vim-textobj-user' },
    },
})

table.insert(lang, {
    lazy = true,
    event = 'BufReadPost',
    'kana/vim-textobj-line',
    dependencies = {
        { 'kana/vim-textobj-user' },
    },
})

table.insert(lang, {
    'lukas-reineke/indent-blankline.nvim',
    lazy = true,
    event = 'BufReadPost',
    config = require('plugins.config.lang.indentline'),
})

table.insert(lang, {
    'windwp/nvim-autopairs',
    lazy = true,
    event = 'BufReadPost',
    config = require('plugins.config.lang.autopairs'),
})

table.insert(lang, {
    'kylechui/nvim-surround',
    lazy = true,
    event = 'BufReadPost',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    config = require('plugins.config.lang.surround'),
})

-- table.insert(lang, {
--     -- WARN: not effect
--     'abecodes/tabout.nvim',
--     enabled = true,
--     config = require('plugins.config.lang.tabout'),
-- })

table.insert(lang, {
    'numToStr/Comment.nvim',
    lazy = true,
    event = { 'BufNewFile', 'BufReadPre' },
    config = require('plugins.config.lang.comment'),
})

table.insert(lang, {
    'folke/todo-comments.nvim',
    lazy = true,
    event = { 'BufNewFile', 'BufReadPre' },
    config = function()
        require('todo-comments').setup({})
    end,
    dependencies = 'nvim-lua/plenary.nvim',
})

table.insert(lang, {
    'nvim-treesitter/nvim-treesitter',
    lazy = true,
    event = { 'BufNewFile', 'BufReadPre' },
    build = function()
        require('nvim-treesitter.install').update({ with_sync = true })
    end,
    config = require('plugins.config.lang.treesitter'),
    dependencies = {
        { 'p00f/nvim-ts-rainbow' },
        { 'nvim-treesitter/nvim-treesitter-textobjects' },
    },
})

table.insert(lang, {
    'folke/trouble.nvim',
    lazy = true,
    cmd = { 'TroubleToggle' },
    config = require('plugins.config.lang.trouble'),
})

table.insert(lang, {
    'mhartington/formatter.nvim',
    enabled = true,
    lazy = true,
    cmd = { 'Format', 'FormatWrite' },
    config = require('plugins.config.lang.formatter'),
})

-- table.insert(lang, {
--     'dhruvasagar/vim-table-mode',
--     lazy = true,
--     ft = 'markdown',
-- })

table.insert(lang, {
    'iamcco/markdown-preview.nvim',
    lazy = true,
    ft = 'markdown',
    build = function()
        -- FIX: if install fail in windows then do
        -- $cd app
        -- $cwd
        -- $npm install
        -- end
        vim.fn['mkdp#util#install']()
    end,

    dependencies = {
        { 'dhruvasagar/vim-table-mode' },
    },
})

table.insert(lang, {
    'simrat39/symbols-outline.nvim',
    lazy = true,
    cmd = 'SymbolsOutline',
    config = require('plugins.config.lang.symbols-outline'),
})

return lang
