return function()
    require('mason-lspconfig').setup({
        ensure_installed = {
            -- lsp server
            'lua_ls',
            'clangd',
            'vimls',
        },
    })

    local lspconfig = require('lspconfig')

    require('mason-lspconfig').setup_handlers({
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function(server_name) -- default handler (optional)
            require('lspconfig')[server_name].setup({})
        end,
        -- Next, you can provide targeted overrides for specific servers.
        ['lua_ls'] = function()
            lspconfig.lua_ls.setup(require('plugins.config.cmp.lsp.lua_ls'))
        end,
        ['clangd'] = function()
            lspconfig.clangd.setup(require('plugins.config.cmp.lsp.clangd'))
        end,
    })
end
