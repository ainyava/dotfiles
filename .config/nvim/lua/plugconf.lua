-- NvimTree
local nvim_tree = require('nvim-tree').setup()

vim.api.nvim_create_autocmd({"BufNewFile", "BufReadPost"}, {
  callback = function(args)
      vim.cmd 'noautocmd NvimTreeOpen'
  end
})

-- Tabline
require('tabline').setup({})
vim.opt.showtabline = 2

-- DevIcons
require('nvim-web-devicons').setup()

