local keys = {
    {
        '<m-p>',
        ':Telescope find_files<cr>',
        mode = 'n',
        noremap = true,
    },
    {
        '<m-f>',
        ':Telescope live_grep<cr>',
        mode = 'n',
        noremap = true,
    },
    {
        '<m-m>',
        ':Telescope oldfiles<cr>',
        mode = 'n',
        noremap = true,
    },

    {
        '<m-u>',
        ':Telescope undo<cr>',
        mode = 'n',
        noremap = true,
    },
    {
        '<m-n>',
        ':Telescope notify<cr>',
        mode = 'n',
        noremap = true,
    },
    {
        '<m-k>',
        ':Telescope keymaps<cr>',
        mode = 'n',
        noremap = true,
    },
}
return keys
