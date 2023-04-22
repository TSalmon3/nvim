local M = {}

function M.clang_format()
    return {
        exe = 'clang-format',
        args = {
            '--assume-filename=' .. vim.api.nvim_buf_get_name(0),
            '-style="{BasedOnStyle: llvm, IndentWidth: 8}"',
        },
        cwd = vim.fn.expand('%:p:h'),
        stdin = true,
    }
end

return M
