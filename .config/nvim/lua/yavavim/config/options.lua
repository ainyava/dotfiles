-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.snacks_animate = false

-- Auto update external writes
vim.g.autoread = true

--au FocusGained,BufEnter * checktime

-- Configure backspace so it acts as it should act
vim.g.backspace = "eol,start,indent"

-- Highlight search
vim.g.hlsearch = true

-- Split window direction
vim.g.splitbelow = true
vim.g.splitright = true

-- Ignore case when searching
vim.g.ignorecase = true
vim.g.smartcase = true

-- Show line number
vim.wo.number = true
vim.wo.relativenumber = true

vim.g.lightline = { colorscheme = "onedark" }
-- Highlight current line
vim.g.cursorline = true

-- Enable filetype plugins
vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")

-- Clipboard
if vim.fn.has("unnamedplus") then
  vim.g.clipboard = "unnamedplus"
else
  vim.g.clipboard = "unnamed"
end
