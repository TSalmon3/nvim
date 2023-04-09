
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	vim.notify("not find nvim-tree!")
end

nvim_tree.setup({
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},

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
		custom = { "node_modules" },
	},

	view = {
		width = 30,
		side = "left",
		mappings = {
			list = {
				-- open file or directory
				{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "editor" },
				-- open file in split window
				{ key = "v", action = "vsplit" },
				{ key = "h", action = "split" },
				-- show hidden file
				{ key = "i", action = "toggle_custom" }, -- show
				{ key = ".", action = "toggle_dotfiles" }, -- hide

				-- preview --
				{ key = "<Tab>", action = "preview" },
				-- file operation
				{ key = "<F5>", action = "refresh" },
				{ key = "c", action = "create" },
				{ key = "d", action = "remove" },
				{ key = "r", action = "rename" },
				{ key = "x", action = "cut" },
				{ key = "y", action = "copy" },
				{ key = "p", action = "paste" },
				{ key = "s", action = "system_open" },
			},
		},
	},
	actions = {
		open_file = {
			resize_window = true,
			quit_on_open = true,
		},
	},
})

-- 自动关闭
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
