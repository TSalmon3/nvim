return {
        "akinsho/bufferline.nvim",
        version = "v3.*",
        dependencies = {
                "nvim-tree/nvim-web-devicons",
                "moll/vim-bbye",
        },
        opts = {
                options = {
                        numbers = "ordinal",
                        offsets = {
                                {
                                        filetype = "NvimTree",
                                        text = "File Explorer",
                                        highlight = "Directory",
                                        text_align = "left",
                                },
                        },
                },
        },
}
