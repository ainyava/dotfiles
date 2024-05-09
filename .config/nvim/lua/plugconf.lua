-- Tabline
require('tabline').setup({})
vim.opt.showtabline = 2

-- DevIcons
require('nvim-web-devicons').setup()

-- Telescope
require('telescope').setup({
  defaults = {
    file_ignore_patterns = {"node_modules/*"}
  }
})
