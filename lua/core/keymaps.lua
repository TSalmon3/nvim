vim.g.mapleader = ','

local opts = { noremap = true }

--
-- Basic Keymap
--
vim.keymap.set('n', '<leader>ev', ':vsplit $MYVIMRC<cr>', opts)
vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<cr>', opts)

-- mode switch
vim.keymap.set('i', 'jk', '<esc>', opts)
vim.keymap.set('v', 'jk', '<esc>', opts)

-- window split
vim.keymap.set('n', 'sv', '<c-w>v', opts)
vim.keymap.set('n', 'sh', '<c-w>s', opts)
vim.keymap.set('n', 'sc', ':quit<cr>', opts)
-- window toggle
vim.keymap.set('n', '<a-h>', '<c-w>h', opts)
vim.keymap.set('n', '<a-j>', '<c-w>j', opts)
vim.keymap.set('n', '<a-k>', '<c-w>k', opts)
vim.keymap.set('n', '<a-l>', '<c-w>l', opts)

-- windows resize
vim.keymap.set('n', '<c-h>', ':vertical resize -2<cr>', opts)
vim.keymap.set('n', '<c-l>', ':vertical resize +2<cr>', opts)
vim.keymap.set('n', '<c-k>', 'resize -2<cr>', opts)
vim.keymap.set('n', '<c-j>', 'resize +2<cr>', opts)
--
-- Plugin Keymap
--
-- markdown
vim.keymap.set('n', '<f1>', ':MarkdownPreviewToggle<cr>', opts)

-- Accelerated jk
vim.keymap.set('n', 'j', '<Plug>(accelerated_jk_gj)', opts)
vim.keymap.set('n', 'k', '<Plug>(accelerated_jk_gk)', opts)

-- Buffer
vim.keymap.set('n', '<leader>1', ':Bdelete! 1<cr>', opts)
vim.keymap.set('n', '<leader>2', ':Bdelete! 2<cr>', opts)
vim.keymap.set('n', '<leader>3', ':Bdelete! 3<cr>', opts)
vim.keymap.set('n', '<leader>4', ':Bdelete! 4<cr>', opts)
vim.keymap.set('n', '<leader>5', ':Bdelete! 5<cr>', opts)
vim.keymap.set('n', '<leader>6', ':Bdelete! 6<cr>', opts)
vim.keymap.set('n', '<leader>7', ':Bdelete! 7<cr>', opts)
vim.keymap.set('n', '<leader>8', ':Bdelete! 8<cr>', opts)
vim.keymap.set('n', '<leader>9', ':Bdelete! 9<cr>', opts)
vim.keymap.set('n', '<leader>0', ':Bdelete! 0<cr>', opts)

-- Terminal
vim.keymap.set('n', 'tt', ':ToggleTerm<cr>', opts)
vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
vim.keymap.set('t', '<a-j>', [[<Cmd>wincmd j<CR>]], opts)
vim.keymap.set('t', '<a-k>', [[<Cmd>wincmd k<CR>]], opts)
vim.keymap.set('t', '<a-h>', [[<Cmd>wincmd h<CR>]], opts)
vim.keymap.set('t', '<a-l>', [[<Cmd>wincmd l<CR>]], opts)

-- File explorer
vim.keymap.set('n', 'te', ':NvimTreeToggle<cr>', opts)

-- Fuzzy Find
vim.keymap.set('n', '<a-p>', ':Telescope find_files<cr>', opts)
vim.keymap.set('n', '<a-f>', ':Telescope live_grep<cr>', opts)
vim.keymap.set('n', '<a-m>', ':Telescope oldfiles<cr>', opts)
vim.keymap.set('n', '<a-w>', ':Telescope projects<cr>', opts)
vim.keymap.set('n', '<a-u>', ':Telescope undo<cr>', opts)
vim.keymap.set('n', '<a-n>', ':Telescope notify<cr>', opts)
vim.keymap.set('n', '<a-b>', ':Telescope keymaps<cr>', opts)
-- vim.keymap.set('n ', '<a-l>', ':Telescope notify<cr>', opts)

-- Motion
vim.keymap.set('n', 'm', '', opts)
vim.keymap.set('n', 'mw', ':HopWord<CR>', opts)
vim.keymap.set('n', 'mc', ':HopChar1<CR>', opts)
vim.keymap.set('n', 'mC', ':HopChar2<CR>', opts)
vim.keymap.set('n', 'ml', ':HopLineStart<CR>', opts)
vim.keymap.set('n', 'mL', ':HopLine<CR>', opts)
vim.keymap.set('n', 'ma', ':HopAnywhere<CR>', opts)

-- Startup view
-- vim.keymap.set('n', '<a-s>', ':Dashboard<cr>', opts)
vim.keymap.set('n', '<a-s>', ':Startify<cr>', opts)
vim.keymap.set('n', '<leader>ss', ':SSave<cr>', opts)
vim.keymap.set('n', '<leader>sc', ':SClose<cr>', opts)

-- Git
vim.keymap.set('n', '<a-g>', ':Neogit<cr>', opts)
vim.keymap.set('n', ']g', '<cmd>Gitsigns next_hunk<cr>', opts)
vim.keymap.set('n', '[g', '<cmd>Gitsigns prev_hunk<cr>', opts)
vim.keymap.set('n', '<leader>hs', ':Gitsigns stage_hunk<CR>', opts)
vim.keymap.set('v', '<leader>hs', ':Gitsigns stage_hunk<CR>', opts)
vim.keymap.set('n', '<leader>hr', ':Gitsigns reset_hunk<CR>', opts)
vim.keymap.set('v', '<leader>hr', ':Gitsigns reset_hunk<CR>', opts)
vim.keymap.set('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>', opts)
vim.keymap.set('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>', opts)
vim.keymap.set('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>', opts)
vim.keymap.set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>', opts)
vim.keymap.set('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', opts)
vim.keymap.set('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>', opts)
vim.keymap.set('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>', opts)
vim.keymap.set('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>', opts)

vim.keymap.set('n', '<f2>', ':DiffviewOpen<cr>', opts)
vim.keymap.set('n', '<f3>', ':DiffviewClose<cr>', opts)

--- LSP
local lsp_enhance = true

vim.keymap.set('n', 'ta', '<cmd>Lspsaga outline<cr>', opts)
-- vim.keymap.set('n', 'ta', '<cmd>SymbolsOutline<cr>', opts)
vim.keymap.set('n', 'tdq', ':TroubleToggle quickfix<cr>', opts)
vim.keymap.set('n', 'tdl', ':TroubleToggle loclist<cr>', opts)
vim.keymap.set('n', 'tdw', ':TroubleToggle workspace_diagnostics<cr>', opts)

if lsp_enhance == false then
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', 'gp', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.keymap.set('n', 'gk', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.keymap.set('n', 'gj', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    vim.keymap.set('n', 'gq', vim.diagnostic.setloclist)
    --
    --     -- Use LspAttach autocommand to only map the following keys
    --     -- after the language server attaches to the current buffer
    --     vim.api.nvim_create_autocmd('LspAttach', {
    --         group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    --         callback = function(ev)
    --             -- Enable completion triggered by <c-x><c-o>
    --             vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    --
    --             -- Buffer local mappings.
    --             -- See `:help vim.lsp.*` for documentation on any of the below functions
    --             local opts = { buffer = ev.buf }
    --
    --             vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    --             vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    --             vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    --             vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    --             vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    --             -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    --             -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    --             -- vim.keymap.set('n', '<space>wl', function()
    --             --         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    --             -- end, opts)
    --             vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    --             vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    --             vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    --             vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    --             vim.keymap.set('n', '<space>f', function()
    --                 vim.lsp.buf.format({ async = true })
    --             end, opts)
    --         end,
    --     })
else
    vim.keymap.set('n', 'gp', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
    vim.keymap.set('n', 'gj', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)
    vim.keymap.set('n', 'gk', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opts)

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
end
