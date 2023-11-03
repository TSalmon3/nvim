local keys = {
    {
        'tt',
        ':ToggleTerm direction=tab<cr>',
        mode = 'n',
        noremap = true,
        desc = 'Toggle terminal',
    },

    {
        'jk',
        [[<C-\><C-n>]],
        mode = 't',
        noremap = true,
    },
    {
        '<esc>',
        [[<C-\><C-n>]],
        mode = 't',
        noremap = true,
    },
    {
        '<m-j>',
        [[<Cmd>wincmd j<CR>]],
        mode = 't',
        noremap = true,
    },
    {
        '<m-k>',
        [[<Cmd>wincmd k<CR>]],
        mode = 't',
        noremap = true,
    },
    {
        '<m-h>',
        [[<Cmd>wincmd h<CR>]],
        mode = 't',
        noremap = true,
    },
    {
        '<m-l>',
        [[<Cmd>wincmd l<CR>]],
        mode = 't',
        noremap = true,
    },
}

return keys
