-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }

        vim.keymap.set('n', 'gD', '<cmd>Lspsaga goto_definition<CR>', opts)
        vim.keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', opts)
        vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc ++keep<cr>', opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wl', function()
        --         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        vim.keymap.set('n', 'gt', '<cmd>Lspsaga peek_type_definition<CR>', opts)
        vim.keymap.set('n', 'gT', '<cmd>Lspsaga goto_type_definition<CR>', opts)
        vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
        vim.keymap.set('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>', opts)
        vim.keymap.set('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
    end,
})

local keys = {
    { 'gp', '<cmd>Lspsaga show_line_diagnostics<CR>', mode = 'n', noremap = true },
    { 'gj', '<cmd>Lspsaga diagnostic_jump_next<cr>', mode = 'n', noremap = true },
    { 'gk', '<cmd>Lspsaga diagnostic_jump_prev<cr>', mode = 'n', noremap = true },
}

return keys
