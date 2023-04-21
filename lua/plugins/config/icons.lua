local icons = {}

icons = {
	dap = {
		Stopped = { " ", "DiagnosticWarn", "DapStoppedLine" },
		Breakpoint = " ",
		BreakpointCondition = " ",
		BreakpointRejected = { " ", "DiagnosticError" },
		LogPoint = ".>",
	},
	diagnostics = {
		Error = " ",
		Warn = " ",
		Hint = " ",
		Info = " ",
		Other = " ",
	},
	git = {
		added = " ",
		modified = " ",
		removed = " ",
		branch = "",
	},

        kind = {
		Class = "ﴯ",
		Color = "",
		Constant = "",
		Constructor = "",
		Enum = "",
		EnumMember = "",
		Event = "",
		Field = "",
		File = "",
		Folder = "",
		Function = "",
		Interface = "",
		Keyword = "",
		Method = "",
		Module = "",
		Namespace = "",
		Number = "",
		Operator = "",
		Package = "",
		Property = "ﰠ",
		Reference = "",
		Snippet = "",
		Struct = "",
		Text = "",
		TypeParameter = "",
		Unit = "",
		Value = "",
		Variable = "",
		-- ccls-specific icons.
		TypeAlias = "",
		Parameter = "",
		StaticMethod = "",
		Macro = "",
	},

        type = {
                Array = "",
                Boolean = "",
                Null = "ﳠ",
                Number = "",
                Object = "",
                String = "",
        },

        cmp = {
		Copilot = "",
		Copilot_alt = "",
	},
	
	statuline = {
		ComponentSep = "|",
		SectionLeftSep = "",
		SectionRightSep = "",
	},

	misc = {
		project = "  ",
		keyboard = "  ",
		recent = "  ",
		setting = "  ",
	},
}

return icons
