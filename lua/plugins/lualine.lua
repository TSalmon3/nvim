local status, lualine = pcall(require, "lualine")
if not status then
	vim.notify("not find lualine")
	return
end

lualine.setup({
        options = {
                theme = 'tokyonight'
        }
})
