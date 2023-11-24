-- Disable default CtrlP
vim.g.loaded_ctrlp = 1

local keyset = vim.keymap.set
local command = vim.api.nvim_command

-- Telescope
local telescope_builtin = require('telescope.builtin')
keyset('n', '<C-p>', telescope_builtin.find_files, {})

-- NvimTree
local tree_api = require "nvim-tree.api"
keyset('n', '<C-b>', tree_api.tree.focus, {})

-- COC
command('inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) :  "\\<Tab>"')
command('inoremap <expr> <S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\\<C-h>"')
command('inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\\<CR>"')
keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})
