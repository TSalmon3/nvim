return {
        -- nvim lspconfig (official)
        {
                "neovim/nvim-lspconfig",
        },


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
                end,
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

                        local lspconfig = require("lspconfig")

                        require("mason-lspconfig").setup_handlers ({

                                -- The first entry (without a key) will be the default handler
                                -- and will be called for each installed server that doesn't have
                                -- a dedicated handler.
                                function (server_name) -- default handler (optional)
                                        require("lspconfig")[server_name].setup{}
                                end,
                                -- Next, you can provide targeted overrides for specific servers.
                                ["lua_ls"] = function ()
                                        lspconfig.lua_ls.setup(require("plugins.lsp.lua_ls"))
                                end,
                                ["clangd"] = function ()
                                       lspconfig.clangd.setup(require("plugins.lsp.clangd"))
                                end


                        })

                end
        }

}
