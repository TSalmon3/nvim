return function()
    local notify = require('notify')
    notify.setup({
        timeout = 3000,
        max_height = function()
            return math.floor(vim.o.lines * 0.75)
        end,
        max_width = function()
            return math.floor(vim.o.columns * 0.5)
        end,
    })
    vim.notify = notify
end
