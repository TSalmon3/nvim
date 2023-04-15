vim.g.mapleader = ","

local opts = { noremap = true }

--
-- Basic Keymap
--

-- mode switch
vim.keymap.set("i", "jk", "<esc>", opts)
vim.keymap.set("v", "jk", "<esc>", opts)

-- window split
vim.keymap.set("n", "sv", "<c-w>v", opts)
vim.keymap.set("n", "sh", "<c-w>s", opts)
vim.keymap.set("n", "sc", ":quit<cr>", opts)
-- window toggle
vim.keymap.set("n", "<a-h>", "<c-w>h", opts)
vim.keymap.set("n", "<a-j>", "<c-w>j", opts)
vim.keymap.set("n", "<a-k>", "<c-w>k", opts)
vim.keymap.set("n", "<a-l>", "<c-w>l", opts)

--
-- Plugin Keymap
--

-- Terminal
vim.keymap.set("n", "tt", ":ToggleTerm<cr>", opts)

-- File explorer
vim.keymap.set("n", "te", ":NvimTreeToggle<cr>", opts)

-- Fuzzy Find
vim.keymap.set("n", "<a-p>", ":Telescope find_files<cr>", opts)
vim.keymap.set("n", "<a-f>", ":Telescope live_grep<cr>", opts)
vim.keymap.set("n", "<a-m>", ":Telescope oldfiles<cr>", opts)

-- Motion
vim.keymap.set("n", "m", "", opts)
vim.keymap.set("n", "mw", ":HopWord<CR>", opts)
vim.keymap.set("n", "mc", ":HopChar1<CR>", opts)
vim.keymap.set("n", "mC", ":HopChar2<CR>", opts)
vim.keymap.set("n", "ml", ":HopLineStart<CR>", opts)
vim.keymap.set("n", "mL", ":HopLine<CR>", opts)
vim.keymap.set("n", "ma", ":HopAnywhere<CR>", opts)

-- Startup view
vim.keymap.set("n", "<a-s>", ":Dashboard<cr>", opts)

--- LSP
local lsp_enhance = true

vim.keymap.set("n", "ta", ":SymbolsOutline<cr>", opts)
vim.keymap.set("n", "tdq", ":TroubleToggle quickfix<cr>", opts)
vim.keymap.set("n", "tdl", ":TroubleToggle loclist<cr>", opts)
vim.keymap.set("n", "tdw", ":TroubleToggle workspace_diagnostics<cr>", opts)

if lsp_enhance == false then
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        vim.keymap.set("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
        vim.keymap.set("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
        vim.keymap.set("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
        vim.keymap.set("n", "gq", vim.diagnostic.setloclist)

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                        -- Enable completion triggered by <c-x><c-o>
                        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                        -- Buffer local mappings.
                        -- See `:help vim.lsp.*` for documentation on any of the below functions
                        local opts = { buffer = ev.buf }

                        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                        -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                        -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                        -- vim.keymap.set('n', '<space>wl', function()
                        --         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                        -- end, opts)
                        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
                        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
                        vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
                        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                        vim.keymap.set("n", "<space>f", function()
                                vim.lsp.buf.format({ async = true })
                        end, opts)
                end,
        })
else
        vim.keymap.set("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
        vim.keymap.set("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
        vim.keymap.set("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                        -- Enable completion triggered by <c-x><c-o>
                        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                        -- Buffer local mappings.
                        -- See `:help vim.lsp.*` for documentation on any of the below functions
                        local opts = { buffer = ev.buf }

                        vim.keymap.set("n", "gD", "<cmd>Lspsaga goto_definition<CR>", opts)
                        vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
                        vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc ++keep<cr>", opts)
                        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                        -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                        -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                        -- vim.keymap.set('n', '<space>wl', function()
                        --         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                        -- end, opts)
                        vim.keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", opts)
                        vim.keymap.set("n", "gT", "<cmd>Lspsaga goto_type_definition<CR>", opts)
                        vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
                        vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
                        vim.keymap.set("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opts)
                        vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
                end,
        })
end
