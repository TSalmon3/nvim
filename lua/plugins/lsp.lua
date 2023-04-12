return {

        -- mason --
        {
                "williamboman/mason.nvim",
                build = ":MasonUpdate", -- :MasonUpdate updates registry contents
                config = function()
                        require("mason").setup({
                                ui = {
                                        icons = {
                                                package_installed = "✓",
                                                package_pending = "➜",
                                                package_uninstalled = "✗"
                                        }
                                }
                        })
                end
        },

        {
                "neovim/nvim-lspconfig",
        },

        -- mason-lspconfig --
        {
                "williamboman/mason-lspconfig.nvim",
                config = function()
                        require("mason-lspconfig").setup({
                                ensure_installed = { 
                                        "lua_ls",
                                        "clangd",
                                        "vimls"
                                },
                        })

                end
        }

}
