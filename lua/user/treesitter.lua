local status, configs = pcall(require, "nvim-treesitter.configs")
if not status then
	vim.notify("not find treesitter")
	return
end

configs.setup {
  ensure_installed = {"c", "vim", "lua"},
  sync_install = false, 
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = false,

  },
  indent = { enable = true },
}
