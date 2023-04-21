local editor = {}

-- colorscheme
table.insert(editor, {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd([[colorscheme tokyonight]])
	end,
})

--startup panel
table.insert(editor, {
	"glepnir/dashboard-nvim",
	lazy = true,
	event = "VimEnter",
	config = require("plugins.config.editor.dashboard"),
	--dependencies = { { "nvim-tree/nvim-web-devicons" } },
})

--- explorer
table.insert(editor, {
	"nvim-tree/nvim-tree.lua",
	lazy = true,
	cmd = {
		"NvimTreeToggle",
	},
	version = "*",
	config = require("plugins.config.editor.nvim-tree"),
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
})

--- statusline
table.insert(editor, {
	"nvim-lualine/lualine.nvim",
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("plugins.config.editor.lualine"),
})

--- bufferline
table.insert(editor, {
	"akinsho/bufferline.nvim",
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	version = "v3.*",
	config = require("plugins.config.editor.bufferline"),
})

-- terminal
table.insert(editor, {
	"akinsho/toggleterm.nvim",
	lazy = true,
	cmd = { "ToggleTerm" },
	version = "*",
	config = require("plugins.config.editor.toggleterm"),
})

-- fuzzy finder
table.insert(editor, {
	"nvim-telescope/telescope.nvim",
	enabled = true,
	tag = "0.1.1",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"ahmedkhalf/project.nvim",
			config = require("plugins.config.editor.project"),
		},
		{ "debugloop/telescope-undo.nvim" },
	},
	config = require("plugins.config.editor.telescope"),
})

-- gitsigns
table.insert(editor, {
	"lewis6991/gitsigns.nvim",
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("plugins.config.editor.gitsigns"),
})

table.insert(editor, {
	"sindrets/diffview.nvim",
	lazy = true,
	cmd = { "DiffviewOpen", "DiffviewClose" },
	dependencies = "nvim-lua/plenary.nvim",
})

-- move
table.insert(editor, {
	"phaazon/hop.nvim",
	lazy = true,
	event = "BufReadPost",
	branch = "v2", -- optional but strongly recommended
	config = require("plugins.config.editor.hop"),
})

table.insert(editor, {
	"romainl/vim-cool",
	lazy = true,
	event = { "CursorMoved", "InsertEnter" },
})

return editor
