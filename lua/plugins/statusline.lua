return {
        {
  'nvim-lualine/lualine.nvim',
  dependencise = { 'nvim-tree/nvim-web-devicons', lazy = true },
  config = function()
          require("lualine").setup()
  end
}
}
