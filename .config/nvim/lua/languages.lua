-- Co
vim.g.coc_global_extensions = {'coc-tsserver', 'coc-eslint', 'coc-prettier'}

-- Key mappings
vim.api.nvim_set_keymap('i', '<silent><expr>', '<c-space> coc#refresh()', { noremap = true })

