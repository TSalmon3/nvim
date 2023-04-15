return {
        "glepnir/dashboard-nvim",
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
        event = "VimEnter",
        opts = {
                -- config
                theme = "doom",
                config = {
                        header = {
                                [[]],
                                [[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
                                [[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
                                [[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
                                [[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
                                [[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
                                [[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
                                [[                                              ]],
                                [[             [ version : 0.0.1 ]              ]],
                                [[]],
                                [[]],
                        },
                        center = {
                                {
                                        icon = "  ",
                                        desc = "Projects                            ",
                                        action = "Telescope projects",
                                },
                                {
                                        icon = "  ",
                                        desc = "Recently files                      ",
                                        action = "Telescope oldfiles",
                                },
                                {
                                        icon = "  ",
                                        desc = "Edit keybindings                    ",
                                        action = "edit ~/.config/nvim/lua/user/keymaps.lua",
                                },
                                {
                                        icon = "  ",
                                        desc = "Edit Projects                       ",
                                        action = "edit ~/.local/share/nvim/project_nvim/project_history",
                                },
                        },
                        footer = {
                                "",
                                "",
                                "https://github.com/TSalmon3/nvim.git",
                        },
                },
        },
}
