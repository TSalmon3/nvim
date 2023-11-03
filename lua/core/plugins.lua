local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- directory where plugins will be installed
    root = vim.fn.stdpath('data') .. '/lazy',
    -- lockfile generated after running update.
    lockfile = vim.fn.stdpath('config') .. '/lazy-lock.json',
    spec = {
        { import = 'core.plugins.editor' },
        { import = 'core.plugins.text' },
        { import = 'core.plugins.cmp' },
        { import = 'core.plugins.format' },
        { import = 'core.plugins.vcs' },
        { import = 'core.plugins.comment' },
    },
    install = {
        missing = true,
        colorscheme = { 'tokyonight' },
    },
    defaults = {
        lazy = false, -- should plugins be lazy-loaded?
        version = nil,
        -- default `cond` you can use to globally disable a lot of plugins
        -- when running inside vscode for example
        cond = nil, ---@type boolean|fun(self:LazyPlugin):boolean|nil
        -- version = "*", -- enable this to try installing the latest stable versions of plugins
    },
    checker = {
        -- automatically check for plugin updates
        enabled = false,
    },
})
