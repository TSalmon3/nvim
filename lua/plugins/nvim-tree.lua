return {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {
                "nvim-tree/nvim-web-devicons",
        },    
        config = function()

                -- disable netrw at the very start of your init.lua (strongly advised)
                vim.g.loaded_netrw = 1
                vim.g.loaded_netrwPlugin = 1

                -- set termguicolors to enable highlight groups
                vim.opt.termguicolors = true
                require("nvim-tree").setup({
                        update_cwd = true,
                        sync_root_with_cwd = true,
                        respect_buf_cwd = true,

                        update_focused_file = {
                                enable = true,
                                update_root = true
                        },

                        git = {enable = false},

                        filters = {
                                dotfiles = true
                        }
                })
        end,
}

