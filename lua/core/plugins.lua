local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require('lazy').startup({

  -- 主题
  'folke/tokyonight.nvim',

  -- 状态栏
  {
        'nvim-lualine/lualine.nvim',
        denpendencies = { 'nvim-tree/nvim-web-devicons', opt = true }
  },

  {'akinsho/bufferline.nvim', denpendencies = 'nvim-tree/nvim-web-devicons'},


  -- 文件浏览器
  {
        'nvim-tree/nvim-tree.lua',
        denpendencies = {
        'nvim-tree/nvim-web-devicons', -- optional
        },
 
  },

  -- 代码高亮
  {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
  },

  -- 模糊搜索
  {
        'nvim-telescope/telescope.nvim', 
        tag = '0.1.1',
        denpendencies = { {'nvim-lua/plenary.nvim'} }
  },

  -- autopair
  {"windwp/nvim-autopairs"},

  -- surround
  {
        "kylechui/nvim-surround",
        tag = "2.0.5", -- Use for stability; omit to use `main` branch for the latest features

  },

  -- git
  {"lewis6991/gitsigns.nvim"},

  --启动页
  {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        denpendencies = {'nvim-tree/nvim-web-devicons'}
  },
})



