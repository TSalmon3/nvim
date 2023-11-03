return function()
    vim.opt.termguicolors = true
    require('bufferline').setup({
        options = {
            separator_style = 'thin',
            -- indicator = {style = 'underline'},
            offsets = {
                -- {
                --     filetype = 'NvimTree',
                --     text = 'File Explorer',
                --     highlight = 'Directory',
                --     text_align = 'left',
                -- },
            },
        },
    })
end
