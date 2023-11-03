vim.api.nvim_exec(
    [[
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.lua FormatWrite
    autocmd BufWritePost *.c FormatWrite
    autocmd BufWritePost *.h FormatWrite
    autocmd BufWritePost *.md FormatWrite
    autocmd BufWritePost *.py FormatWrite
    augroup END
    ]],
    true
)

return function()
    require('formatter').setup({
        filetype = {
            python = {
                require('plugins.format.formatter.type.python').black,
            },

            lua = {
                require('plugins.format.formatter.type.lua').stylua,
            },

            c = {
                require('plugins.format.formatter.type.c').clang_format,
            },

            cpp = {
                require('plugins.format.formatter.type.c').clang_format,
            },

            markdown = {
                require('plugins.format.formatter.type.markdown').prettier,
            },
        },
    })
end
