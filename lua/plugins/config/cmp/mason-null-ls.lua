return function()
	require("mason-null-ls").setup({
		ensure_installed = {
			"stylua",
			"clang-format",
			"prettier",
			-- Opt to list sources here, when available in mason.
		},
		automatic_installation = true,
		handlers = {},
	})
end
