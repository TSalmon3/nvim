local icons = require('plugins.config.icons')

local diagnostics = {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    sections = { 'error', 'warn', 'hint' },
    symbols = {
        error = icons.diagnostics.Error,
        warn = icons.diagnostics.Warn,
        info = icons.diagnostics.Info,
        hint = icons.diagnostics.Hint,
    },
    colored = false,
    update_in_insert = false,
    always_visible = true,
}

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local diff = {
    'diff',
    colored = false,
    symbols = {
        -- added = icons.git.added,
        -- modified = icons.git.modified,
        -- removed = icons.git.removed,

        added = '+',
        modified = '~',
        removed = '-',
    },
    cond = hide_in_width,
}

local mode = {
    'mode',
    fmt = function(str)
        return '-- ' .. str .. ' --'
    end,
}

local filetype = {
    'filetype',
    icons_enabled = false,
    icon = nil,
}

local branch = {
    'branch',
    icons_enabled = true,
    icon = icons.git.branch,
}

local location = {
    'location',
    padding = 0,
}

local fileformat = {
    'fileformat',
    symbols = {
        unix = 'LF',
        dos = 'CRLF',
        mac = 'CR',
    },
}

local progress = function()
    local current_line = vim.fn.line('.')
    local total_lines = vim.fn.line('$')
    local chars = { '__', '▁▁', '▂▂', '▃▃', '▄▄', '▅▅', '▆▆', '▇▇', '██' }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
end

local spaces = function()
    return 'spaces: ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth')
end

return function()
    --[[
+-------------------------------------------------+
| A | B | C                             X | Y | Z |
+-------------------------------------------------+
]]
    require('lualine').setup({
        options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = icons.statuline.ComponentSep,
            section_separators = {
                left = icons.statuline.SectionLeftSep,
                right = icons.statuline.SectionRightSep,
            },
            always_divide_middle = true,
            globalstatus = true,
        },
        sections = {
            lualine_a = { mode },
            lualine_b = { branch, diff },
            lualine_c = {},
            lualine_x = { diagnostics },
            -- lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = { 'encoding', fileformat, 'filetype' },
            lualine_z = { location, 'progress' },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        },
        extensions = {
            -- 'nvim-tree',
        },
    })
end
