vim.diagnostic.config({
        virtual_text = false,
        signs = true,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

return {

        --
        -- lsp enhance
        --
        {
                "glepnir/lspsaga.nvim",
                event = "LspAttach",
                dependencies = {
                        { "nvim-tree/nvim-web-devicons" },
                        --Please make sure you install markdown and markdown_inline parser
                        { "nvim-treesitter/nvim-treesitter" },
                },
                config = function()
                        require("lspsaga").setup({
                                ui = {
                                        -- This option only works in Neovim 0.9
                                        title = true,
                                        -- Border type can be single, double, rounded, solid, shadow.
                                        border = "single",
                                        winblend = 0,
                                        expand = "",
                                        collapse = "",
                                        code_action = "💡",
                                        incoming = " ",
                                        outgoing = " ",
                                        hover = " ",
                                        kind = {},
                                },
                                symbol_in_winbar = {
                                        enable = true,
                                        separator = " ",
                                        ignore_patterns = {},
                                        hide_keyword = true,
                                        show_file = true,
                                        folder_level = 2,
                                        respect_root = false,
                                        color_mode = true,
                                },
                                finder = {
                                        max_height = 0.5,
                                        min_width = 30,
                                        force_max_height = false,
                                        keys = {
                                                jump_to = "<cr>",
                                                expand_or_jump = "o",
                                                vsplit = "s",
                                                split = "i",
                                                tabe = "t",
                                                tabnew = "r",
                                                quit = { "<esc>", "q" },
                                                close_in_preview = "<ESC>",
                                        },
                                },
                                definition = {
                                        edit = "<C-c>o",
                                        vsplit = "<C-c>v",
                                        split = "<C-c>i",
                                        tabe = "<C-c>t",
                                        quit = "q",
                                },
                                code_action = {
                                        num_shortcut = true,
                                        show_server_name = false,
                                        extend_gitsigns = true,
                                        keys = {
                                                -- string | table type
                                                quit = "q",
                                                exec = "<CR>",
                                        },
                                },
                                hover = {
                                        max_width = 0.6,
                                        open_link = "gx",
                                        open_browser = "!chrome",
                                },
                                rename = {
                                        quit = "<ESC>",
                                        exec = "<CR>",
                                        mark = "x",
                                        confirm = "<CR>",
                                        in_select = true,
                                },
                        })
                end,
        },

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
                                                package_uninstalled = "✗",
                                        },
                                },
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
                                        "vimls",
                                },
                        })

                        local lspconfig = require("lspconfig")

                        require("mason-lspconfig").setup_handlers({
                                -- The first entry (without a key) will be the default handler
                                -- and will be called for each installed server that doesn't have
                                -- a dedicated handler.
                                function(server_name) -- default handler (optional)
                                        require("lspconfig")[server_name].setup({})
                                end,
                                -- Next, you can provide targeted overrides for specific servers.
                                ["lua_ls"] = function()
                                        lspconfig.lua_ls.setup(require("plugins.lsp.lua_ls"))
                                end,
                                ["clangd"] = function()
                                        lspconfig.clangd.setup(require("plugins.lsp.clangd"))
                                end,
                        })
                end,
        },

        --
        -- LSP diagnostic
        --
        {
                "folke/trouble.nvim",
                dependencies = "nvim-tree/nvim-web-devicons",
                config = function()
                        require("trouble").setup({
                                position = "bottom", -- position of the list can be: bottom, top, left, right
                                height = 10, -- height of the trouble list when position is top or bottom
                                width = 50, -- width of the list when position is left or right
                                icons = true, -- use devicons for filenames
                                mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
                                fold_open = "", -- icon used for open folds
                                fold_closed = "", -- icon used for closed folds
                                group = true, -- group results by file
                                padding = true, -- add an extra new line on top of the list
                                action_keys = {
                                        -- key mappings for actions in the trouble list
                                        -- map to {} to remove a mapping, for example:
                                        -- close = {},
                                        close = "q", -- close the list
                                        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
                                        refresh = "r", -- manually refresh
                                        jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
                                        open_split = { "<c-x>" }, -- open buffer in new split
                                        open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
                                        open_tab = { "<c-t>" }, -- open buffer in new tab
                                        jump_close = { "o" }, -- jump to the diagnostic and close the list
                                        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
                                        toggle_preview = "P", -- toggle auto_preview
                                        hover = "K", -- opens a small popup with the full multiline message
                                        preview = "p", -- preview the diagnostic location
                                        close_folds = { "zM", "zm" }, -- close all folds
                                        open_folds = { "zR", "zr" }, -- open all folds
                                        toggle_fold = { "zA", "za" }, -- toggle fold of current file
                                        previous = "k", -- previous item
                                        next = "j", -- next item
                                },
                                indent_lines = true, -- add an indent guide below the fold icons
                                auto_open = false, -- automatically open the list when you have diagnostics
                                auto_close = false, -- automatically close the list when you have no diagnostics
                                auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
                                auto_fold = false, -- automatically fold a file trouble list at creation
                                auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
                                signs = {
                                        -- icons / text used for a diagnostic
                                        error = "",
                                        warning = "",
                                        hint = "",
                                        information = "",
                                        other = "﫠",
                                },
                                use_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
                        })
                end,
        },

        --
        -- LSP format
        --
        {
                "jay-babu/mason-null-ls.nvim",
                dependencies = {
                        "williamboman/mason.nvim",
                        "jose-elias-alvarez/null-ls.nvim",
                },
                config = function()
                        require("mason-null-ls").setup({
                                ensure_installed = {
                                        "stylua",
                                        "clang-format",
                                        "prettier",
                                        -- Opt to list sources here, when available in mason.
                                },
                                automatic_installation = true,
                                handlers = {},
                        })
                end,
        },

        {
                "jose-elias-alvarez/null-ls.nvim",
                dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
                config = function()
                        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
                        require("null-ls").setup({
                                debug = true,
                                source = {
                                        require("null-ls").builtins.formatting.prettier,
                                        require("null-ls").builtins.formatting.stylua,
                                        require("null-ls").builtins.formatting.clang_format.with({
                                                extra_args = {
                                                        -- "--style",
                                                        -- "{IndentWidth:8}",
                                                        string.format("-style=file:%s/.clang-format",
                                                        vim.fn.expand("~/AppData/Local/nvim/style")),
                                                },
                                        }),
                                },
                                -- on_init = function(new_client, _)
                                --         new_client.offset_encoding = "utf-8"
                                -- end,
                                on_attach = function(client, bufnr)
                                        if client.supports_method("textDocument/formatting") then
                                                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                                                vim.api.nvim_create_autocmd("BufWritePre", {
                                                        group = augroup,
                                                        buffer = bufnr,
                                                        callback = function()
                                                                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                                                                vim.lsp.buf.format({ bufnr = bufnr })
                                                        end,
                                                })
                                        end
                                end,
                        })
                end,
        },
}
