return {
        "akinsho/bufferline.nvim",
        version = "v3.*",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {
                options = {
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
