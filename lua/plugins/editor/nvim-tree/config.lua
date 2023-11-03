local icons = require('core.icons')

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

        -- on_attach = function(bufnr)
        -- vim.keymap.set('n', 'z', ':NvimTreeCollapse<cr>', { noremap = true, bufnr = bufnr })
        -- end,

        update_cwd = true,
        --->> project dependences
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
            enable = true,
            update_root = true,
        },
        ----<< project dependences end

        git = {
            enable = true,
        },
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
        filters = {
            git_ignored = true,
            dotfiles = true,
            custom = {
                '.clang-format',
                '.toml',
            },
            exclude = {
                '.git',
            },
        },

        view = {
            width = 30,
            side = 'left',
            signcolumn = 'yes',
        },
        renderer = {
            icons = {
                webdev_colors = true,
                git_placement = 'after',
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true,
                },

                glyphs = {
                    git = {
                        unstaged = 'U',
                        staged = 'S',
                        unmerged = 'UM',
                        renamed = 'R',
                        deleted = 'D',
                        untracked = 'UT',
                        ignored = 'I',
                        -- unstaged = icons.git2.Mod_alt,
                        -- staged = icons.git2.Add, --󰄬
                        -- unmerged = icons.git2.Unmerged,
                        -- renamed = icons.git2.Rename, --󰁔
                        -- untracked = icons.git2.Untracked, -- "󰞋"
                        -- deleted = icons.git2.Remove, --
                        -- ignored = icons.git2.Ignore, --◌
                    },

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
