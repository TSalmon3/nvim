return function()
    local icons = require('plugins.config.icons')
    local notify = require('notify')
    notify.setup({
        stages = 'slide',
        timeout = 3000,
        max_height = function()
            return math.floor(vim.o.lines * 0.75)
        end,
        max_width = function()
            return math.floor(vim.o.columns * 0.25)
        end,
        icons = {
            DEBUG = icons.log.DEBUG,
            ERROR = icons.log.ERROR,
            INFO = icons.log.INFO,
            TRACE = icons.log.TRACE,
            WARN = icons.log.WARN,
        },
    })

    -- BUG: multiple different client offset_encodings (between copilot,
    -- nvim-lsp and null-ls)
    vim.notify = function(msg, ...)
        if msg:match('warning: multiple different client offset_encodings') then
            return
        end

        notify(msg, ...)
    end
end
