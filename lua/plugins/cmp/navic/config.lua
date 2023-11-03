local icons = require('core.icons')

return function()
    require('nvim-navic').setup({
        icons = icons.kind,
        lsp = {
            auto_attach = true,
            preference = nil,
        },
        highlight = true,
        separator = ' > ',
        depth_limit = 5,
        depth_limit_indicator = '..',
        safe_output = true,
        click = false,
    })
end
