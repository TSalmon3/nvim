
local set = vim.opt

-- 行号
set.relativenumber = true
set.number = true

-- 缩进
set.tabstop = 8
set.shiftwidth = 8
set.expandtab = true
set.autoindent = true


-- 光标行
set.cursorline = true

-- 启用鼠标
set.mouse:append("a")

-- 系统剪切板
set.clipboard:append("unnamedplus")

-- 默认新窗口右和下
set.splitright = true
set.splitbelow = true

-- 搜索
set.ignorecase = true
set.smartcase = true

-- 外观
set.termguicolors = true
set.signcolumn = "yes"


-- vim.cmd[[colorscheme tokyonight-moon]]
