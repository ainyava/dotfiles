local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
Plug('crispgm/nvim-tabline')
Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-tree/nvim-web-devicons')
Plug('Xuyuanp/nerdtree-git-plugin')
Plug('ryanoasis/vim-devicons')
Plug('tiagofumo/vim-nerdtree-syntax-highlight')
Plug('preservim/nerdcommenter')
Plug('dense-analysis/ale')
Plug('ctrlpvim/ctrlp.vim')
Plug('itchyny/vim-gitbranch')
Plug('leafgarland/typescript-vim')
Plug('pangloss/vim-javascript')
Plug('mattn/emmet-vim')
Plug('ap/vim-css-color')
Plug('godlygeek/tabular')
Plug('plasticboy/vim-markdown')
Plug('joshdick/onedark.vim')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.4' })
Plug('xiyaowong/transparent.nvim')
Plug('tpope/vim-sleuth')
-- Javascript
Plug('pangloss/vim-javascript')
Plug('leafgarland/typescript-vim')
Plug('peitalin/vim-jsx-typescript')
Plug('styled-components/vim-styled-components', { branch = 'main' })
Plug('jparise/vim-graphql')
-- Completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'wbthomason/packer.nvim'
Plug 'mrcjkb/rustaceanvim'
vim.call('plug#end')

require('telescope')
