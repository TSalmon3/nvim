local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { 'utf-8' }

local on_attach = function(client, bufnr)
    -- keybinding on attch
    -- vim.api.nvim_create_autocmd('LspAttach', {
    --     group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    --     callback = function(ev)
    --         -- Enable completion triggered by <c-x><c-o>
    --         vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    --
    --         -- Buffer local mappings.
    --         -- See `:help vim.lsp.*` for documentation on any of the below functions
    --         local opts = { buffer = ev.buf }
    --
    --         vim.keymap.set('n', 'gD', '<cmd>Lspsaga goto_definition<CR>', opts)
    --         vim.keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', opts)
    --         vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc ++keep<cr>', opts)
    --         vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    --         vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    --         -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    --         -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    --         -- vim.keymap.set('n', '<space>wl', function()
    --         --         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    --         -- end, opts)
    --         vim.keymap.set('n', 'gt', '<cmd>Lspsaga peek_type_definition<CR>', opts)
    --         vim.keymap.set('n', 'gT', '<cmd>Lspsaga goto_type_definition<CR>', opts)
    --         vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts)
    --         vim.keymap.set({ 'n', 'v' }, '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
    --         vim.keymap.set('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>', opts)
    --         -- vim.keymap.set('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
    --     end,
    -- })

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
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.stdpath('config') .. '/lua'] = true,
                    [vim.fn.stdpath('data') .. 'lazy'] = true,
                },
            },
        },
    },
}
