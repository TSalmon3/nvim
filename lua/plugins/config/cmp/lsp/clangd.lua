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
end

return {
    cmd = { 'clangd' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
    single_file_support = true,
    on_attach = on_attach,
    capabilities = capabilities,
}
