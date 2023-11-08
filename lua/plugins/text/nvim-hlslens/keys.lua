local keys = {
    {
        'n',
        [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
        mode = 'n',
        noremap = true,
    },
    {
        'N',
        [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
        mode = 'n',
        noremap = true,
    },
    { '*', [[*<Cmd>lua require('hlslens').start()<CR>]], mode = 'n', noremap = true },
    { '#', [[#<Cmd>lua require('hlslens').start()<CR>]], mode = 'n', noremap = true },
    { 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], mode = 'n', noremap = true },
    { 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], mode = 'n', noremap = true },
    { 'q', '<Cmd>noh<CR>', mode = 'n', noremap = true },
    { '<esc>', '<Cmd>noh<CR>', mode = 'n', noremap = true },
}

return keys
