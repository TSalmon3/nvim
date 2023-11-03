return function()
    require('gitsigns').setup({
        signs = {

            -- add = { hl = "GitGutterAdd", text = "▍" },
            add = { hl = 'GitGutterAdd', text = '+' },
            -- change = { hl = 'GitGutterChange', text = '▍' },
            change = { hl = 'GitGutterChange', text = '~' },
            -- delete = { hl = 'GitGutterDelete', text = '▍' },
            delete = { hl = 'GitGutterDelete', text = '_' },
            topdelete = { hl = 'GitGutterDeleteChange', text = '▔' },
            changedelete = { hl = 'GitGutterChange', text = '~' },
            -- untracked = { hl = 'GitGutterAdd', text = '▍' },
            untracked = { hl = 'GitGutterAdd', text = '┆' },
        },
        numhl = false,
        linehl = false,
        watch_gitdir = { interval = 1000 },
        sign_priority = 6,
        update_debounce = 200,
        status_formatter = nil,
    })
end
