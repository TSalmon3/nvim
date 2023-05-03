local editor = {}

table.insert(editor, {
    'glepnir/nerdicons.nvim',
    enabled = false,
    cmd = 'NerdIcons',
    config = function()
        require('nerdicons').setup({})
    end,
})

-- colorscheme
table.insert(editor, {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        -- vim.cmd([[colorscheme tokyonight]])
    end,
})

table.insert(editor, {
    'olimorris/onedarkpro.nvim',
    lazy = false,
    priority = 1000, -- Ensure it loads first
    config = function()
        -- vim.cmd([[colorscheme onedark]])
        -- vim.cmd([[colorscheme onedark_vivid]])
    end,
})

table.insert(editor, {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
        vim.cmd([[colorscheme gruvbox]])
    end,
})

--startup panel
table.insert(editor, {
    'glepnir/dashboard-nvim',
    enabled = false,
    lazy = true,
    event = 'VimEnter',
    config = require('plugins.config.editor.dashboard'),
    --dependencies = { { "nvim-tree/nvim-web-devicons" } },
})

table.insert(editor, {
    'mhinz/vim-startify',
    lazy = true,
    event = 'VimEnter',
    config = require('plugins.config.editor.vim-startify'),
})

--- explorer
table.insert(editor, {
    'justinmk/vim-dirvish',
    lazy = false,
})

table.insert(editor, {
    'nvim-tree/nvim-tree.lua',
    lazy = true,
    cmd = {
        'NvimTreeToggle',
    },
    version = '*',
    config = require('plugins.config.editor.nvim-tree'),
    dependencies = { 'nvim-tree/nvim-web-devicons' },
})

--- statusline
table.insert(editor, {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
    config = require('plugins.config.editor.lualine'),
})

--- bufferline
table.insert(editor, {
    'akinsho/bufferline.nvim',
    -- lazy = true,
    -- event = { "BufReadPost", "BufAdd", "BufNewFile" },
    version = '*',
    config = require('plugins.config.editor.bufferline'),
    dependencies = { 'nvim-tree/nvim-web-devicons' },
})

-- terminal
table.insert(editor, {
    'akinsho/toggleterm.nvim',
    lazy = true,
    cmd = { 'ToggleTerm' },
    version = '*',
    config = require('plugins.config.editor.toggleterm'),
})

-- fuzzy finder
table.insert(editor, {
    'nvim-telescope/telescope.nvim',
    enabled = true,
    tag = '0.1.1',
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        {
            'ahmedkhalf/project.nvim',
            config = require('plugins.config.editor.project'),
        },
        { 'debugloop/telescope-undo.nvim' },
        {
            'rcarriga/nvim-notify',
            config = require('plugins.config.editor.nvim-notify'),
        },
    },
    config = require('plugins.config.editor.telescope'),
})

table.insert(editor, {
    'tpope/vim-fugitive',
    lazy = false,
    dependencies = {
        { 'junegunn/gv.vim' },
    },
})

-- gitsigns
table.insert(editor, {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
    config = require('plugins.config.editor.gitsigns'),
})

table.insert(editor, {
    'sindrets/diffview.nvim',
    lazy = true,
    cmd = { 'DiffviewOpen', 'DiffviewClose' },
    dependencies = 'nvim-lua/plenary.nvim',
})

-- move
table.insert(editor, {
    'phaazon/hop.nvim',
    lazy = true,
    event = 'BufReadPost',
    branch = 'v2', -- optional but strongly recommended
    config = require('plugins.config.editor.hop'),
})

table.insert(editor, {
    'romainl/vim-cool',
    lazy = true,
    event = 'CmdlineEnter',
    config = require('plugins.config.editor.vim-cool'),
})

table.insert(editor, {
    'rainbowhxch/accelerated-jk.nvim',
    lazy = true,
    event = 'VeryLazy',
    config = require('plugins.config.editor.accelerated-js'),
})

table.insert(editor, {
    'mg979/vim-visual-multi',
    lazy = true,
    event = 'BufReadPost',
    config = require('plugins.config.editor.vim-visual-multi'),
})

table.insert(editor, {
    'TimUntersberger/neogit',
    enabled = true,
    config = require('plugins.config.editor.neogit'),
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
    },
})

return editor
