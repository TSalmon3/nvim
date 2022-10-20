local status, surround = pcall(require, "nvim-surround")
if not status then
	vim.notify("not find surround")
end


surround.setup()
