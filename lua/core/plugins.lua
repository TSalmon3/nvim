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


require("lazy").setup({

        spec = {
                {import = "plugins"}
        },

        -- directory where plugins will be installed
        root = vim.fn.stdpath("data") .. "/lazy", 

        defaults = {
                lazy = false, -- should plugins be lazy-loaded?
                version = nil,
        },

        -- lockfile generated after running update.
        lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
        install = { colorscheme = { "tokyonight" } },
        checker = { enabled = false }, -- automatically check for plugin updates
})



