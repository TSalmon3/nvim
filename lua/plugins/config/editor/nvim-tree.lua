vim.cmd([[
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])

return function()
    -- disable netrw at the very start of your init.lua (strongly advised)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true
    require('nvim-tree').setup({
        update_cwd = true,
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
            enable = true,
            update_root = true,
        },
        view = {
            mappings = {
                list = {
                    -- 打开文件或文件夹
                    { key = { '<CR>', 'o', '<2-LeftMouse>' }, action = 'edit' },
                    -- 分屏打开文件
                    { key = 'v', action = 'vsplit' },
                    { key = 'h', action = 'split' },
                    -- 显示隐藏文件
                    { key = 'i', action = 'toggle_custom' }, -- 对应 filters 中的 custom (node_modules)
                    { key = '.', action = 'toggle_dotfiles' }, -- Hide (dotfiles)
                    -- 文件操作
                    { key = '<F5>', action = 'refresh' },
                    { key = 'a', action = 'create' },
                    { key = 'd', action = 'remove' },
                    { key = 'r', action = 'rename' },
                    { key = 'x', action = 'cut' },
                    { key = 'c', action = 'copy' },
                    { key = 'p', action = 'paste' },
                    { key = 's', action = 'system_open' },
                },
            },
        },
        git = { enable = false },
        filters = {
            dotfiles = true,
            custom = { '.git' },
            exclude = {
                '.clang-format',
                '.stylua.toml',
            },
        },
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
        renderer = {
            icons = {
                webdev_colors = true,
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = false,
                },
                padding = ' ',
                symlink_arrow = '  ',
                glyphs = {
                    default = '',
                    symlink = '',
                    bookmark = '',
                    folder = {
                        arrow_open = '',
                        arrow_closed = '',
                        -- arrow_open = "",
                        -- arrow_closed = "",
                        default = '',
                        open = '',
                        empty = '',
                        empty_open = '',
                        symlink = '',
                        symlink_open = '',
                    },
                },
            },
        },
    })
end
