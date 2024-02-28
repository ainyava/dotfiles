-- Enable Syntax highlighting
vim.opt.guifont='Comic Mono'
vim.g.syntax = true

-- Enable 256 colors pallete in terminal
vim.g.t_Co = 256
vim.g.background = 'dark'

if vim.fn.has('nvim') then
  -- let $NVIM_TUI_ENABLE_TRUE_COLOR=1
end

if vim.fn.has('termguicolors') then
	vim.opt.termguicolors = true
end

-- Set utf8 as standard encoding and en_US as the standard language
vim.g.encoding= 'utf8'
vim.g.NERDTreeWinSize = 23

-- Select color scheme
vim.cmd('colorscheme onedark')
vim.g.lightline = { colorscheme = 'onedark' }
vim.g.airline_theme = 'onedark'

require("transparent").setup({ -- Optional, you don't have to run setup.
  groups = { -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
    'EndOfBuffer',
  },
  extra_groups = {}, -- table: additional groups that should be cleared
  exclude_groups = {}, -- table: groups you don't want to clear
})

vim.g.TransparentEnable = true
