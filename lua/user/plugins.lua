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
			return require("packer.util").float({ border = "single"})
		end
	}
})


packer.startup({
	function(use)
		use("wbthomason/packer.nvim")	-- packer repo
		
		use("nvim-lua/plenary.nvim")	-- dependency
		use("kyazdani42/nvim-web-devicons") --dependency

		use("folke/tokyonight.nvim")	-- color scheme

      	use("nvim-telescope/telescope.nvim") -- telescope repo

		use("kyazdani42/nvim-tree.lua") -- nvim-tree repo
			

	end

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

