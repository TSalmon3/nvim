local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	vim.notify("not find nvim-tree!")
end

nvim_tree.setup(
	{
		 renderer = {
			root_folder_modifier = ":t",
			icons = {
			  glyphs = {
				default = "",
				symlink = "",
				folder = {
				  arrow_open = "",
				  arrow_closed = "",
				  default = "",
				  open = "",
				  empty = "",
				  empty_open = "",
				  symlink = "",
				  symlink_open = "",
				},
				git = {
				  unstaged = "",
				  staged = "S",
				  unmerged = "",
				  renamed = "➜",
				  untracked = "U",
				  deleted = "",
				  ignored = "◌",
				},
			  },
			},
		  },
		  

		filters = {
			dotfiles = true,
			custom = {'node_modules'},
		},
		
		view = {
			width = 30,
			side = 'left',
			mappings = {
				list = {
					i = {
						-- page move
						["<C-j>"] = "move_selection_next",
						["<C-k>"] = "move_selection_previous",
						["<Down>"] = "move_selection_next",
						["<Up>"] = "move_selection_previous",
						-- history record
						["<C-n>"] = "cycle_history_next",
						["<C-p>"] = "cycle_history_prev",
						-- close window
						["<C-c>"] = "close",
						-- preview window scrolling
						["<C-u>"] = "preview_scrolling_up",
						["<C-d>"] = "preview_scrolling_down"
					}
				}
			},
		},
		actions = {
			open_file = {
				resize_window = true,
				quit_on_open = true,
			},
		},

		system_open = {
			cmd = 'wsl-open',
		},
	}
)
