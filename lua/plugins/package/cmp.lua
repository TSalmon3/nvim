local cmp = {}

table.insert(cmp, {
    'github/copilot.vim',
    lazy = false,
    event = 'InsertEnter',
})

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
            branch = 'formatting-fixes',
            enabled = true,
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
        {
            'liuchengxu/vista.vim',
            config = require('plugins.config.cmp.vista'),
        },
        {
            'SmiteshP/nvim-navic',
            config = require('plugins.config.cmp.navic'),
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

table.insert(cmp, {
    'dhananjaylatkar/vim-gutentags',
    enabled = false,
    lazy = true,
    ft = 'c',
    dependencies = {
        'dhananjaylatkar/cscope_maps.nvim',
        -- 'skywind3000/gutentags_plus',
    },
    config = function()
        vim.cmd([[set tags=./tags;,tags]])
        vim.g.gutentags_project_root = { '.root', '.git', '.project' }
        vim.g.gutentags_modules = { 'cscope_maps', 'ctags' }
        vim.g.gutentags_cache_dir = vim.fn.expand('~/.cache')
        vim.g.gutentags_ctags_tagfile = '.tags'

        vim.g.gutentags_ctags_extra_args = {
            '--fields=+niazS',
            '--extra=+q',
            '--c++-kinds=+px',
            '--c-kinds=+px',
            '--output-format=e-ctags',
        }
        vim.g.gutentags_generate_on_write = 1
    end,
    -- config = require('plugins.config.cmp.vim-gutentags'),
})

table.insert(cmp, {
    'dhananjaylatkar/cscope_maps.nvim',
    lazy = true,
    ft = 'c',
    dependencies = {
        {
            'skywind3000/vim-preview',
            config = function()
                vim.cmd([[
                autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
                autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
                ]])
            end,
        },
    },
    config = function()
        require('cscope_maps').setup({
            cscope = {
                db_file = './cscope.out', -- location of cscope db file
                use_telescope = false, -- true will show results in telescope picker
                db_build_cmd = { -- cmd used for :Cscope build
                    exec = 'cscope',
                    -- args = { '-bqkv' },
                    args = { '-Rbk' },
                },
            },
        })
    end,
})

return cmp
