vim.keymap.set('n', 'm', '', opts)
vim.keymap.set('n', 'mw', ':HopWord<CR>', opts)
vim.keymap.set('n', 'mc', ':HopChar1<CR>', opts)
vim.keymap.set('n', 'mC', ':HopChar2<CR>', opts)
vim.keymap.set('n', 'ml', ':HopLineStart<CR>', opts)
vim.keymap.set('n', 'mL', ':HopLine<CR>', opts)
vim.keymap.set('n', 'ma', ':HopAnywhere<CR>', opts)

local keys = {
    {
        'm',
        '',
        mode = 'n',
        noremap = true,
    },
    {
        'mw',
        ':HopWord<cr>',
        mode = 'n',
        noremap = true,
    },
    {
        'mc',
        ':HopChar1<cr>',
        mode = 'n',
        noremap = true,
    },
    {
        'mC',
        ':HopChar2<cr>',
        mode = 'n',
        noremap = true,
    },
    {
        'ml',
        ':HopLineStart<cr>',
        mode = 'n',
        noremap = true,
    },
    {
        'mL',
        ':HopLine<cr>',
        mode = 'n',
        noremap = true,
    },
    {
        'ma',
        ':HopAnywhere<cr>',
        mode = 'n',
        noremap = true,
    },
}

return keys
