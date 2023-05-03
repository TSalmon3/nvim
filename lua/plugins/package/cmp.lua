local cmp = {}

table.insert(cmp, {
    'hrsh7th/nvim-cmp',
    lazy = true,
    event = 'InsertEnter',
    config = require('plugins.config.cmp.nvim-cmp'),
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
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-cmdline' },

        {
            'zbirenbaum/copilot-cmp',
            config = require('plugins.config.cmp.copilot-cmp'),
            dependencies = {
                {
                    'zbirenbaum/copilot.lua',
                    build = ':Copilot auth',
                    config = require('plugins.config.cmp.copilot'),
                },
            },
        },

        {
            'onsails/lspkind.nvim',
            -- config = require("plugins.config.cmp.lspkind"),
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
            config = require('plugins.config.cmp.mason'),
        },
        {
            'williamboman/mason-lspconfig.nvim',
            config = require('plugins.config.cmp.mason-lspconfig'),
        },

        {
            'glepnir/lspsaga.nvim',
            config = require('plugins.config.cmp.lspsaga'),
        },
        {
            'ray-x/lsp_signature.nvim',
        },
    },
    -- config = require("plugins.config.cmp.nvim-lspconfig"),
})

table.insert(cmp, {
    'jose-elias-alvarez/null-ls.nvim',
    enabled = true,
    lazy = true,
    event = { 'BufReadPost' },
    config = require('plugins.config.cmp.null-ls'),
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        {
            'jay-babu/mason-null-ls.nvim',
            config = require('plugins.config.cmp.mason-null-ls'),
        },
    },
})

-- table.insert(cmp, {
--     'ludovicchabant/vim-gutentags',
--     lazy = true,
--     ft = 'c',
--     dependencies = {
--         'skywind3000/gutentags_plus',
--     },
--     config = require('plugins.config.cmp.vim-gutentags'),
-- })

table.insert(cmp, {
    'dhananjaylatkar/cscope_maps.nvim',
    lazy = true,
    ft = 'c',
    dependencies = {
        'ludovicchabant/vim-gutentags',
    },
    config = function()
        vim.g.gutentags_modules = { 'cscope_maps' } -- This is required. Other config is optional
        vim.g.gutentags_cscope_build_inverted_index_maps = 1
        vim.g.gutentags_cache_dir = vim.fn.expand('~/.cache/.tags')
        vim.g.gutentags_file_list_command = 'fd -e c -e h'
        -- vim.g.gutentags_trace = 1
        require('cscope_maps').setup({})
    end,
})

return cmp
