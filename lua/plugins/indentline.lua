return {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
                require("indent_blankline").setup({
                        -- 空行占位
                        space_char_blankline = " ",
                        -- 用 treesitter 判断上下文
                        show_current_context = true,
                        show_current_context_start = true,

                        -- :echo &filetype
                        filetype_exclude = {
                                "dashboard",
                                "help"
                        },
                        -- 竖线样式
                        -- char = '¦'
                        -- char = '┆'
                        -- char = '│'
                        -- char = "⎸",
                        char = "▏",
                })
        end
}
