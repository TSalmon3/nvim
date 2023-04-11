return {
  'nvim-lualine/lualine.nvim',
  enabled = true,
  dependencise = { 'nvim-tree/nvim-web-devicons', lazy = true },
  config = function()
          require("lualine").setup()
  end
}
