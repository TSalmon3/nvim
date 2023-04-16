return {
	"nvim-treesitter/nvim-treesitter",
	enabled = true,
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
	opts = {
		ensure_installed = {},
		highlight = { enable = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
