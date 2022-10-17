local status, autopairs = pcall(require, "nvim-autopairs")
if not status then
	vim.notify("not find autopairs")
	return
end

autopairs.setup({
	disable_filetype = { "TelescopePrompt", "vim" },
})
