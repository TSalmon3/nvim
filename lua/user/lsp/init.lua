local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("user.lsp.mason")
require("user.lsp.lspsaga")
require("user.lsp.handlers").setup()
-- require("user.lsp.lsp-installer")
require("user.lsp.null_ls")
require("user.lsp.trouble")


--- setting lsp server ---
local status, lspconfig = pcall(require, "lspconfig")
if not status then
	vim.notify("not find lspconfig")
	return
end

lspconfig["sumneko_lua"].setup(require("user.lsp.settings.sumneko_lua"))

lspconfig["clangd"].setup(require("user.lsp.settings.clangd"))
