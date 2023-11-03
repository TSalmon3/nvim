-- formatter
--
--
local format = {}

table.insert(format, {
    'mhartington/formatter.nvim',
    enabled = true,
    lazy = true,
    cmd = { 'Format', 'FormatWrite' },
    config = require('plugins.format.formatter.config'),
})

return format
