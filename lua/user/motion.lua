local status, hop = pcall(require, "hop")
if not status then
	vim.notify("not found hop")
	return
end

hop.setup({
	keys = "etovxqpdygfblzhckisuran",
})
