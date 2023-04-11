return {
        
                    "nvim-treesitter/nvim-treesitter",
                    enabled = true,
                        build = function()
                                        require("nvim-treesitter.install").update({ with_sync = true })
                                            end,
                                    
}
