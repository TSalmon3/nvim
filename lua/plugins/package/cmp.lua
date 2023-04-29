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
-- 	"zbirenbaum/copilot.lua",
-- 	cmd = "Copilot",
-- 	build = ":Copilot auth",
-- 	config = require("plugins.config.cmp.copilot"),
-- 	-- dependencies = {
-- 	--     {
-- 	--         'zbirenbaum/copilot-cmp',
-- 	--         config = require('plugins.config.cmp.copilot-cmp'),
-- 	--     },
-- 	-- },
-- })

return cmp
