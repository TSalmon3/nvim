local icons = require('core.icons')

local kind_icons = {}

return function()
    local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt' then
            return false
        end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match('^%s*$') == nil
    end

    local luasnip = require('luasnip')
    local cmp = require('cmp')

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
            { name = 'nvim_lsp' },
            { name = 'nvim_lua' },
            { name = 'codeium' },
            { name = 'copilot' },
            { name = 'luasnip' },
            { name = 'path' },
            { name = 'buffer' },
        }),

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' },
            },
        }),

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' },
            }, {
                { name = 'cmdline' },
            }),
        }),
        mapping = {
            -- 出现补全
            -- ['<A-o>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
            ['<A-o>'] = cmp.mapping.close(),
            -- 取消
            ['<esc>'] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),
            -- 上一个
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            -- 下一个
            ['<C-n>'] = cmp.mapping.select_next_item(),
            -- 确认
            ['<CR>'] = cmp.mapping.confirm({
                select = false,
                behavior = cmp.ConfirmBehavior.Replace,
            }),
            -- 如果窗口内容太多，可以滚动
            ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
            ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
            ['<Tab>'] = cmp.mapping(function(fallback)
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
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
        },
        formatting = {
            format = function(entry, vim_item)
                local kind_icons = vim.tbl_deep_extend('force', icons.kind, icons.cmp.source)
                vim_item.kind =
                    string.format('%s %s', kind_icons[vim_item.kind] or icons.kind.Undefined, vim_item.kind or '')
                vim_item.menu = ({
                    buffer = '[BUF]',
                    nvim_lsp = '[LSP]',
                    luasnip = '[SNIP]',
                    nvim_lua = '[LUA]',
                    codeium = '[CODE]',
                })[entry.source.name]
                return vim_item
            end,
        },
    })
end
