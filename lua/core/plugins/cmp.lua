-- code completetation
--
--

local cmp = {}

table.insert(cmp, {
    'hrsh7th/nvim-cmp',
    lazy = true,
    event = 'InsertEnter',
    config = require('plugins.cmp.nvim-cmp.config'),
    dependencies = {
        -- "hrsh7th/vim-vsnip",
        -- "hrsh7th/cmp-vsnip",
        {
            'L3MON4D3/LuaSnip',
            dependencies = { 'rafamadriz/friendly-snippets' },
        },

        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lua' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-cmdline' },

        {
            'zbirenbaum/copilot-cmp',
            branch = 'formatting-fixes',
            enabled = false,
            config = require('plugins.cmp.copilot-cmp.config'),
            dependencies = {
                {
                    'zbirenbaum/copilot.lua',
                    build = ':Copilot auth',
                    config = require('plugins.cmp.copilot.config'),
                },
            },
        },
        {
            'Exafunction/codeium.nvim',
            dependencies = {
                'nvim-lua/plenary.nvim',
            },
            config = function()
                require('codeium').setup({})
            end,
        },
    },
})

table.insert(cmp, {
    'neovim/nvim-lspconfig',
    lazy = true,
    event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
    dependencies = {
        {
            'williamboman/mason.nvim',
            build = ':MasonUpdate', -- :MasonUpdate updates registry contents
            config = require('plugins.cmp.mason.config'),
        },
        {
            'williamboman/mason-lspconfig.nvim',
            config = require('plugins.cmp.mason-lspconfig.config'),
        },

        {
            'glepnir/lspsaga.nvim',
            config = require('plugins.cmp.lspsaga.config'),
            keys = require('plugins.cmp.lspsaga.keys'),
        },
        {
            'ray-x/lsp_signature.nvim',
        },
        {
            'liuchengxu/vista.vim',
            config = require('plugins.cmp.vista.config'),
            keys = require('plugins.cmp.vista.keys'),
        },
        {
            'SmiteshP/nvim-navic',
            config = require('plugins.cmp.navic.config'),
        },
    },
    -- config = require("plugins.config.cmp.nvim-lspconfig"),
})

table.insert(cmp, {
    'jose-elias-alvarez/null-ls.nvim',
    enabled = true,
    lazy = true,
    event = { 'BufReadPost' },
    config = require('plugins.cmp.null-ls.config'),
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        {
            'jay-babu/mason-null-ls.nvim',
            config = require('plugins.cmp.mason-null-ls.config'),
        },
    },
})

table.insert(cmp, {
    'simrat39/symbols-outline.nvim',
    lazy = true,
    cmd = 'SymbolsOutline',
    config = require('plugins.cmp.symbols-outline.config'),
})

table.insert(cmp, {
    'folke/trouble.nvim',
    lazy = true,
    cmd = { 'TroubleToggle' },
    config = require('plugins.cmp.trouble.config'),
    keys = require('plugins.cmp.trouble.keys'),
})

return cmp
