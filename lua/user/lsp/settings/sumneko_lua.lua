local handlers = require("user.lsp.handlers")

return {
	on_attach = handlers.on_attach,
	capabilities = handlers.capabilities,

	-- cmd = {"lua-language-server"},
	filetype = {"lua"},
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
					[vim.fn.stdpath("data") .. "/site/pack/packer/start"] = true,
				},
			},
		},
	},
}
