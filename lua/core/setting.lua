-- 行号
vim.opt.relativenumber = true
vim.opt.number = true

-- 备份
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- 缩进
vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
vim.opt.expandtab = true
vim.opt.autoindent = true


-- 光标行
vim.opt.cursorline = true

-- 启用鼠标
vim.opt.mouse:append("a")

-- 系统剪切板
vim.opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
vim.opt.splitright = true
vim.opt.splitbelow = true

-- 搜索
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- 外观
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"


vim.cmd[[set shell=powershell]]
