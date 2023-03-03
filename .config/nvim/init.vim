""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"   Ainyava
"
"
""""""""""""""""""""""""""""""""""""""""
" Plugins Install
""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'preservim/nerdcommenter'
Plug 'dense-analysis/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'drewtempelmeyer/palenight.vim'

call plug#end()


""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""

" Auto read when file changes from outside
set autoread
au FocusGained,BufEnter * checktime

" Configure backspace so it acts as it should act
" set backspace=eol,start,indent

" Highlight search
" set hlsearch

" Split window direction
set splitbelow
set splitright

" Ignore case when searching
set ignorecase

" Show line number
set number

" Highlight current line
set cursorline

" Enable filetype plugins
filetype plugin on
filetype indent on


""""""""""""""""""""""""""""""""""""""""
" Theme, Colors & Fonts
""""""""""""""""""""""""""""""""""""""""

" Enable Syntax highlighting
syntax enable

" Enable 256 colors pallete in terminal
set t_Co=256
set background=dark

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

" Set utf8 as standard encoding and en_US as the standard language
" set encoding=utf8

" Select color scheme
colorscheme palenight
let g:lightline = { 'colorscheme': 'palenight' }
let g:airline_theme = "palenight"

" Clipboard
if has("unnamedplus")
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif

