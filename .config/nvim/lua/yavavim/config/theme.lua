-- Enable Syntax highlighting
vim.opt.guifont = "ComicMonoNF"
vim.g.syntax = true

-- Enable 256 colors pallete in terminal
vim.g.t_Co = 256
vim.g.background = "dark"

if vim.fn.has("termguicolors") then
  vim.opt.termguicolors = true
end

-- Set utf8 as standard encoding and en_US as the standard language
vim.g.encoding = "utf8"
vim.g.NERDTreeWinSize = 23

-- Select color scheme
require("onedark").setup({
  style = "warmer",
  transparent = true,
})
require("onedark").load()

vim.g.airline_theme = "onedark"

vim.g.TransparentEnable = true

require("bufferline").setup{}

