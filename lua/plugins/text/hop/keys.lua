local keys = {
	{
		"m",
		"",
		mode = "n",
		noremap = true,
	},
	{
		"mw",
		":HopWord<cr>",
		mode = "n",
		noremap = true,
	},
	{
		"mc",
		":HopChar1<cr>",
		mode = "n",
		noremap = true,
	},
	{
		"mC",
		":HopChar2<cr>",
		mode = "n",
		noremap = true,
	},
	{
		"ml",
		":HopLineStart<cr>",
		mode = "n",
		noremap = true,
	},
	{
		"mL",
		":HopLine<cr>",
		mode = "n",
		noremap = true,
	},
	{
		"ma",
		":HopAnywhere<cr>",
		mode = "n",
		noremap = true,
	},
}

return keys
