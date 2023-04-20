return function()
	opts = {
		options = {
			numbers = "ordinal",
			separator_style = "thick",
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					highlight = "Directory",
					text_align = "left",
				},
				{
					filetype = "lspsagaoutline",
					text = "Lspsaga Outline",
					text_align = "center",
					padding = 1,
				},
			},
		},
	}
	require("bufferline").setup(opts)
end
