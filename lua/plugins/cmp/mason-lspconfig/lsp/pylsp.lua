local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.offsetEncoding = { 'utf-8' }

local on_attach = function(client, bufnr)
    -- lsp_signature
    require('lsp_signature').on_attach({
        bind = true,
        use_lspsaga = false,
        floating_window = true,
        fix_pos = true,
        hint_enable = true,
        hi_parameter = 'Search',
        handler_opts = {
            border = 'rounded',
        },
    })
    -- winbar lsp
    require('nvim-navic').attach(client, bufnr)
end

return {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { 'W391' },
                    maxLineLength = 80,
                },
            },
        },
    },
}