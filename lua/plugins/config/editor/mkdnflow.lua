return function()
	require("mkdnflow").setup({
		perspective = {
			priority = "first",
			root_tell = ".root",
		},
	})
end
