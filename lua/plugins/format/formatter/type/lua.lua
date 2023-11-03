local M = {}

function M.stylua()
    return {
        exe = 'stylua',
        args = {
            -- "--config-path "
            --   .. os.getenv("XDG_CONFIG_HOME")
            --   .. "/stylua/stylua.toml",
            '-',
        },
        stdin = true,
    }
end

return M
