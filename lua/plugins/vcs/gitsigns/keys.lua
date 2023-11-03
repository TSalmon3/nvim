local keys = {
    { '<m-g>', ':Neogit<cr>', mode = 'n', noremap = true },
    { ']g', '<cmd>Gitsigns next_hunk<cr>', mode = 'n', noremap = true },
    { '[g', '<cmd>Gitsigns prev_hunk<cr>', mode = 'n', noremap = true },
    { '<leader>hs', ':Gitsigns stage_hunk<CR>', mode = 'n', noremap = true },
    { '<leader>hs', ':Gitsigns stage_hunk<CR>', mode = 'v', noremap = true },
    { '<leader>hr', ':Gitsigns reset_hunk<CR>', mode = 'n', noremap = true },
    { '<leader>hr', ':Gitsigns reset_hunk<CR>', mode = 'v', noremap = true },
    { '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>', mode = 'n', noremap = true },
    { '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>', mode = 'n', noremap = true },
    { '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>', mode = 'n', noremap = true },
    { '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>', mode = 'n', noremap = true },
    { '<leader>hb', '<cmd>lua require"gitsigns".blame_line{true}<CR>', mode = 'n', noremap = true },
    { '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>', mode = 'n', noremap = true },
    { '<leader>hd', '<cmd>Gitsigns diffthis<CR>', mode = 'n', noremap = true },
    { '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>', mode = 'n', noremap = true },
}

return keys
