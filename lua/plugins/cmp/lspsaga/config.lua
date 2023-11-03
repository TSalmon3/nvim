local icons = require('core.icons')

return function()
    require('lspsaga').setup({
        symbol_in_winbar = {
            enable = false,
        },

        ui = {
            border = 'single', -- Can be single, double, rounded, solid, shadow.
            devicon = true,
            title = true,
            expand = icons.ui.ArrowClosed,
            collapse = icons.ui.ArrowOpen,
            code_action = icons.ui.CodeAction,
            actionfix = icons.ui.Spell,
            lines = { '┗', '┣', '┃', '━', '┏' },
            imp_sign = icons.kind.Implementation,
            kind = {
                -- Kind
                Class = { icons.kind.Class, 'LspKindClass' },
                Constant = { icons.kind.Constant, 'LspKindConstant' },
                Constructor = { icons.kind.Constructor, 'LspKindConstructor' },
                Enum = { icons.kind.Enum, 'LspKindEnum' },
                EnumMember = { icons.kind.EnumMember, 'LspKindEnumMember' },
                Event = { icons.kind.Event, 'LspKindEvent' },
                Field = { icons.kind.Field, 'LspKindField' },
                File = { icons.kind.File, 'LspKindFile' },
                Function = { icons.kind.Function, 'LspKindFunction' },
                Interface = { icons.kind.Interface, 'LspKindInterface' },
                Key = { icons.kind.Keyword, 'LspKindKey' },
                Method = { icons.kind.Method, 'LspKindMethod' },
                Module = { icons.kind.Module, 'LspKindModule' },
                Namespace = { icons.kind.Namespace, 'LspKindNamespace' },
                Number = { icons.kind.Number, 'LspKindNumber' },
                Operator = { icons.kind.Operator, 'LspKindOperator' },
                Package = { icons.kind.Package, 'LspKindPackage' },
                Property = { icons.kind.Property, 'LspKindProperty' },
                Struct = { icons.kind.Struct, 'LspKindStruct' },
                TypeParameter = { icons.kind.TypeParameter, 'LspKindTypeParameter' },
                Variable = { icons.kind.Variable, 'LspKindVariable' },
                -- Type
                Array = { icons.type.Array, 'LspKindArray' },
                Boolean = { icons.type.Boolean, 'LspKindBoolean' },
                Null = { icons.type.Null, 'LspKindNull' },
                Object = { icons.type.Object, 'LspKindObject' },
                String = { icons.type.String, 'LspKindString' },
                -- ccls-specific icons.
                TypeAlias = { icons.kind.TypeAlias, 'LspKindTypeAlias' },
                Parameter = { icons.kind.Parameter, 'LspKindParameter' },
                StaticMethod = { icons.kind.StaticMethod, 'LspKindStaticMethod' },
                -- Microsoft-specific icons.
                Text = { icons.kind.Text, 'LspKindText' },
                Snippet = { icons.kind.Snippet, 'LspKindSnippet' },
                Folder = { icons.kind.Folder, 'LspKindFolder' },
                Unit = { icons.kind.Unit, 'LspKindUnit' },
                Value = { icons.kind.Value, 'LspKindValue' },
            },
        },

        finder = {
            max_height = 0.5,
            min_width = 30,
            force_max_height = false,
            keys = {
                jump_to = '<cr>',
                expand_or_jump = 'o',
                vsplit = 's',
                split = 'i',
                tabe = 't',
                tabnew = 'r',
                quit = { '<esc>', 'q' },
                close_in_preview = '<ESC>',
            },
        },
        definition = {
            edit = '<C-c>o',
            vsplit = '<C-c>v',
            split = '<C-c>i',
            tabe = '<C-c>t',
            quit = 'q',
        },
        code_action = {
            num_shortcut = true,
            show_server_name = false,
            extend_gitsigns = true,
            keys = {
                -- string | table type
                quit = 'q',
                exec = '<CR>',
            },
        },
        hover = {
            max_width = 0.6,
            open_link = 'gx',
            open_browser = '!chrome',
        },
        rename = {
            quit = '<ESC>',
            exec = '<CR>',
            mark = 'x',
            confirm = '<CR>',
            in_select = true,
        },
    })
end
