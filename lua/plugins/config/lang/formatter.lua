vim.api.nvim_exec(
    [[
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.lua FormatWrite
    autocmd BufWritePost *.c FormatWrite
    autocmd BufWritePost *.h FormatWrite
    augroup END
]],
    true
)

return function()
    require('formatter').setup({
        filetype = {
            lua = {
                require('plugins.config.lang.format.lua').stylua,
            },

            c = {
                require('plugins.config.lang.format.c').clang_format,
            },
        },
    })
end
