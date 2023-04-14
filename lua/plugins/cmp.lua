
return {
        -- 
        -- cmp-enhance
        --
        {
                "onsails/lspkind.nvim",
                config = function()
                        require('lspkind').init({ 
                                -- DEPRECATED (use mode instead): enables text annotations
                                --
                                -- default: true
                                -- with_text = true,

                                -- defines how annotations are shown
                                -- default: symbol
                                -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
                                mode = 'symbol_text',

                                -- default symbol map
                                -- can be either 'default' (requires nerd-fonts font) or
                                -- 'codicons' for codicon preset (requires vscode-codicons font)
                                --
                                -- default: 'default'
                                preset = 'codicons',

                                -- override preset symbols
                                --
                                -- default: {}
                                symbol_map = {
                                        Text = "",
                                        Method = "",
                                        Function = "",
                                        Constructor = "",
                                        Field = "ﰠ",
                                        Variable = "",
                                        Class = "ﴯ",
                                        Interface = "",
                                        Module = "",
                                        Property = "ﰠ",
                                        Unit = "塞",
                                        Value = "",
                                        Enum = "",
                                        Keyword = "",
                                        Snippet = "",
                                        Color = "",
                                        File = "",
                                        Reference = "",
                                        Folder = "",
                                        EnumMember = "",
                                        Constant = "",
                                        Struct = "פּ",
                                        Event = "",
                                        Operator = "",
                                        TypeParameter = ""
                                },
                        })
                end
        },


        --
        -- cmp engine
        --
        {
                "hrsh7th/nvim-cmp",
                dependencise = "onsails/lspkind.nvim",
                config = function()

                        local has_words_before = function()
                                unpack = unpack or table.unpack
                                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
                        end

                        local luasnip = require("luasnip")
                        local cmp = require("cmp")

                        cmp.setup({
                                snippet = {
                                        -- REQUIRED - you must specify a snippet engine
                                        expand = function(args)
                                                -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                                                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                                                -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                                                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                                        end,
                                },
                                sources = cmp.config.sources({
                                        { name = "nvim_lsp" },
                                        -- For vsnip users.
                                        -- { name = "vsnip" },

                                        -- For luasnip users.
                                        { name = 'luasnip' },

                                        --For ultisnips users.
                                        -- { name = 'ultisnips' },

                                        -- -- For snippy users.
                                        -- { name = 'snippy' },
                                }, { { name = "buffer" }, { name = "path" } }),

                                -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
                                cmp.setup.cmdline({ '/', '?' }, {
                                        mapping = cmp.mapping.preset.cmdline(),
                                        sources = {
                                                { name = 'buffer' }
                                        }
                                }),

                                -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
                                cmp.setup.cmdline(':', {
                                        mapping = cmp.mapping.preset.cmdline(),
                                        sources = cmp.config.sources({
                                                { name = 'path' }
                                        }, {
                                                        { name = 'cmdline' }
                                                })
                                }),

                                mapping = {
                                        -- 出现补全
                                        ["<A-o>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
                                        -- 取消
                                        ["<esc>"] = cmp.mapping({
                                                i = cmp.mapping.abort(),
                                                c = cmp.mapping.close()
                                        }),
                                        -- 上一个
                                        ["<A-k>"] = cmp.mapping.select_prev_item(),
                                        -- 下一个
                                        ["<A-j>"] = cmp.mapping.select_next_item(),
                                        -- 确认
                                        ["<CR>"] = cmp.mapping.confirm({
                                                select = true,
                                                behavior = cmp.ConfirmBehavior.Replace
                                        }),
                                        -- 如果窗口内容太多，可以滚动
                                        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
                                        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),

                                        ["<Tab>"] = cmp.mapping(function(fallback)
                                                if cmp.visible() then
                                                        cmp.select_next_item()
                                                        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
                                                        -- they way you will only jump inside the snippet region
                                                elseif luasnip.expand_or_jumpable() then
                                                        luasnip.expand_or_jump()
                                                elseif has_words_before() then
                                                        cmp.complete()
                                                else
                                                        fallback()
                                                end
                                        end, { "i", "s" }),

                                        ["<S-Tab>"] = cmp.mapping(function(fallback)
                                                if cmp.visible() then
                                                        cmp.select_prev_item()
                                                elseif luasnip.jumpable(-1) then
                                                        luasnip.jump(-1)
                                                else
                                                        fallback()
                                                end
                                        end, { "i", "s" }),

                                },

                                formatting = {
                                        format = require("lspkind").cmp_format({
                                                mode = 'symbol_text',
                                                --mode = 'symbol', -- show only symbol annotations

                                                maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                                                -- The function below will be called before any actual modifications from lspkind
                                                -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                                                before = function (entry, vim_item)
                                                        -- Source 显示提示来源
                                                        vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
                                                        return vim_item
                                                end
                                        })
                                }
                        })
                end
        },



        --
        -- snippet engine
        --
        {
                "hrsh7th/vim-vsnip",
                enabled = false
        },

        {
                "hrsh7th/cmp-vsnip",
                enabled = false
        },
        {
                "L3MON4D3/LuaSnip"
        },

        --
        -- lsp source
        --
        {
                "hrsh7th/cmp-nvim-lsp"
        },

        --
        -- buffer source
        -- 
        {
                "hrsh7th/cmp-buffer"
        },

        --
        -- path source 
        --
        {
                "hrsh7th/cmp-path"
        },

        --
        -- cmdline source 
        --
        {
                "hrsh7th/cmp-cmdline"
        },

        --
        -- snippest source
        -- 
        {
                "rafamadriz/friendly-snippets"

        }

}
