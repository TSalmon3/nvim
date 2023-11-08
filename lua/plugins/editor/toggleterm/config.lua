return function()
	require("toggleterm").setup({
		autochdir = true,
		close_on_exit = true, -- close the terminal window when the process exits,
	})
end
