local status, bufferline = pcall(require, "bufferline")
if not status then
	vim.notify("not find bufferline")
	return
end

bufferline.setup({
        options = {
                dianostics = 'nvim_lsp',
                -- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
                offsets = {{
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        text_align = "left",
                }}

        }

})
