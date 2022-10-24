local handlers = require("user.lsp.handlers")

return {
	on_attach = handlers.on_attach,
	capabilities = handlers.capabilities,

	cmd = { "clangd" },
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	single_file_support = true,
}
