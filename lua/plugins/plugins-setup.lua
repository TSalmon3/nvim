local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd[[
        augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
        augroup end
]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- 主题
  use 'folke/tokyonight.nvim' 

  -- 状态栏
  use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons'}


  -- 文件浏览器
  use {
        'nvim-tree/nvim-tree.lua',
        requires = {
        'nvim-tree/nvim-web-devicons', -- optional
        },
 
  }

  -- 代码高亮
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
  }

  -- 模糊搜索
  use {
        'nvim-telescope/telescope.nvim', 
        tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- autopair
  use {"windwp/nvim-autopairs"}

  -- surround
  use{
        "kylechui/nvim-surround",
        tag = "2.0.5", -- Use for stability; omit to use `main` branch for the latest features

  }

  -- git
  use {"lewis6991/gitsigns.nvim"}

  --启动页
  use {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        requires = {'nvim-tree/nvim-web-devicons'
  }
}



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


