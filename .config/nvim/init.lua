----------------------------------------
-- Maintainer:
--   Ainyava
----------------------------------------

----------------------------------------
-- Plugins
----------------------------------------
require('plugins')


----------------------------------------
-- General settings
----------------------------------------
vim.cmd('set autoread')

--au FocusGained,BufEnter * checktime

-- Configure backspace so it acts as it should act
vim.cmd('set backspace=eol,start,indent')

-- Highlight search
vim.cmd('set hlsearch')

-- Split window direction
vim.cmd('set splitbelow')
vim.cmd('set splitright')

-- Ignore case when searching
vim.cmd('set ignorecase')
vim.cmd('set smartcase')

-- Show line number
vim.cmd('set number')

-- Highlight current line
vim.cmd('set cursorline')

-- Enable filetype plugins
vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')


-- Theme, Colors & Fonts

-- Enable Syntax highlighting
vim.cmd('syntax enable')

-- Enable 256 colors pallete in terminal
vim.cmd('set t_Co=256')
vim.cmd('set background=dark')

if vim.fn.has('nvim') then
  -- let $NVIM_TUI_ENABLE_TRUE_COLOR=1
end

if vim.fn.has('termguicolors') then
  vim.cmd('set termguicolors')
end

-- Set utf8 as standard encoding and en_US as the standard language
vim.cmd('set encoding=utf8')

vim.g.NERDTreeWinSize = 60


-- Select color scheme
vim.cmd('colorscheme palenight')
vim.g.lightline = { colorscheme = 'palenight' }
vim.g.airline_theme = 'palenight'

-- Clipboard
if vim.fn.has('unnamedplus') then
    vim.cmd('set clipboard=unnamsedplus')
else
    vim.cmd('set clipboard=unnamsed')
end

-- Co
vim.g.coc_global_extensions = {'coc-tsserver', 'coc-eslint', 'coc-prettier'}

-- Key mappings
vim.api.nvim_set_keymap('i', '<silent><expr>', '<c-space> coc#refresh()', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-c>', '"+y', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-v>', '"+p', { noremap = true })


vim.cmd([[
au BufNewFile,BufRead *.py
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set textwidth=79
    set expandtab
    set autoindent
    set fileformat=unix
]])

-- Javascript/Typescript
vim.cmd([[
au BufNewFile,BufRead *.js
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
    set expandtab
    set autoindent
    set fileformat=unix
]])
