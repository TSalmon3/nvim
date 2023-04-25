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
    vim.notify = notify
end
