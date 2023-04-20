return function()
	require("lspsaga").setup({
		ui = {
			-- This option only works in Neovim 0.9
			title = true,
			-- Border type can be single, double, rounded, solid, shadow.
			border = "single",
			winblend = 0,
			expand = "",
			collapse = "",
			code_action = "💡",
			incoming = " ",
			outgoing = " ",
			hover = " ",
			kind = {},
		},
		symbol_in_winbar = {
			enable = true,
			separator = " ",
			ignore_patterns = {},
			hide_keyword = true,
			show_file = true,
			folder_level = 2,
			respect_root = false,
			color_mode = true,
		},
		finder = {
			max_height = 0.5,
			min_width = 30,
			force_max_height = false,
			keys = {
				jump_to = "<cr>",
				expand_or_jump = "o",
				vsplit = "s",
				split = "i",
				tabe = "t",
				tabnew = "r",
				quit = { "<esc>", "q" },
				close_in_preview = "<ESC>",
			},
		},
		definition = {
			edit = "<C-c>o",
			vsplit = "<C-c>v",
			split = "<C-c>i",
			tabe = "<C-c>t",
			quit = "q",
		},
		code_action = {
			num_shortcut = true,
			show_server_name = false,
			extend_gitsigns = true,
			keys = {
				-- string | table type
				quit = "q",
				exec = "<CR>",
			},
		},
		hover = {
			max_width = 0.6,
			open_link = "gx",
			open_browser = "!chrome",
		},
		rename = {
			quit = "<ESC>",
			exec = "<CR>",
			mark = "x",
			confirm = "<CR>",
			in_select = true,
		},
	})
end
