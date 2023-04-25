local icons = require('plugins.config.icons')

return function()
    require('lspkind').init({
        -- DEPRECATED (use mode instead): enables text annotations
        --
        -- default: true
        -- with_text = true,

        -- defines how annotations are shown
        -- default: symbol
        -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
        mode = 'symbol_text',
        -- default symbol map
        -- can be either 'default' (requires nerd-fonts font) or
        -- 'codicons' for codicon preset (requires vscode-codicons font)
        --
        -- default: 'default'
        preset = 'codicons',
        -- override preset symbols
        --
        -- default: {}
        symbol_map = {
            Copilot = icons.kind.Copilot,
            Text = icons.kind.Text,
            Method = icons.kind.Method,
            Function = icons.kind.Function,
            Constructor = icons.kind.Constructor,
            Field = icons.kind.Field,
            Variable = icons.kind.Variable,
            Class = icons.kind.Class,
            Interface = icons.kind.Interface,
            Module = icons.kind.Module,
            Property = icons.kind.Property,
            Unit = icons.kind.Unit,
            Value = icons.kind.Variable,
            Enum = icons.kind.Enum,
            Keyword = icons.kind.Keyword,
            Snippet = icons.kind.Snippet,
            Color = icons.kind.Color,
            File = icons.kind.File,
            Reference = icons.kind.Reference,
            Folder = icons.kind.Folder,
            EnumMember = icons.kind.EnumMember,
            Constant = icons.kind.Constant,
            Struct = icons.kind.Struct,
            Event = icons.kind.Event,
            Operator = icons.kind.Operator,
            TypeParameter = icons.kind.TypeParameter,
        },
    })
end
