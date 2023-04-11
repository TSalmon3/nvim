
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

return {
  "nvim-tree/nvim-tree.lua",
  enalbed = true,
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },    
  config = function()
    require("nvim-tree").setup({
        update_cwd = true,
        root_dirs = {}

    })
  end,
}

