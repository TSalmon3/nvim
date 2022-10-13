local status npairs = pcall(require, "nvim-autopairs")
if not status then
	vim.notify("not find autopairs")
	return
end

autopairs.setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})

