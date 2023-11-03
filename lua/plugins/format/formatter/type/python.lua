local M = {}

function M.black()
    return {
        exe = 'black',
        args = {
            '-q',
            '--line-length',
            '80',
            -- '--experimental-string-processing',
            '-',
        },
        stdin = true,
    }
end

return M
