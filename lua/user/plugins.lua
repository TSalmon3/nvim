local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("not find packer")
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
})

packer.startup({
	function(use)
		use("wbthomason/packer.nvim") -- packer repo

		use("nvim-lua/plenary.nvim") -- dependency
		use("moll/vim-bbye") -- dependency
		use("kyazdani42/nvim-web-devicons") --dependency

		use("folke/tokyonight.nvim") -- color scheme

		use("nvim-telescope/telescope.nvim") -- telescope repo

		use("kyazdani42/nvim-tree.lua") -- nvim-tree repo

		use("akinsho/bufferline.nvim") -- bufferline repo

		use("akinsho/toggleterm.nvim") -- toggleterm repo

		use("nvim-lualine/lualine.nvim") -- lualine repo

		use("windwp/nvim-autopairs") -- autopairs repo

		use("lewis6991/gitsigns.nvim") -- gitsigns repo

		--use("glepnir/dashboard-nvim") -- dashboard
		use("ahmedkhalf/project.nvim") -- project

		use("lewis6991/impatient.nvim")

		use("lukas-reineke/indent-blankline.nvim") --indent-blankline repo
		use("stevearc/aerial.nvim") --aerial repo
		use("goolord/alpha-nvim") --alpha repo
		use("numToStr/Comment.nvim") --comment repo
		use("folke/which-key.nvim") --which key repo
		use("kylechui/nvim-surround") -- surround repo 
		use("phaazon/hop.nvim") -- motion.repo

		-- cmp plugins
		use("hrsh7th/nvim-cmp") -- The completion plugin
		use("hrsh7th/cmp-buffer") -- buffer completions
		use("hrsh7th/cmp-path") -- path completions
		use("hrsh7th/cmp-cmdline") -- cmdline completions
		use("saadparwaiz1/cmp_luasnip") -- snippet completions
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-nvim-lua")

		-- snippets
		use("L3MON4D3/LuaSnip") --snippet engine
		use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

		-- LSP
		use("neovim/nvim-lspconfig") -- enable LSP
		use("williamboman/nvim-lsp-installer") -- simple to use language server installer
		use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
		use("glepnir/lspsaga.nvim")

		-- treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		})
		use("p00f/nvim-ts-rainbow")
		use("nvim-treesitter/playground")
	end,
})

pcall(
	vim.cmd,
	[[
		augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
		augroup end
	]]
)
