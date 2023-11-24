-- Auto update external writes
vim.g.autoread = true

--au FocusGained,BufEnter * checktime

-- Configure backspace so it acts as it should act
vim.g.backspace = 'eol,start,indent'

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

-- Highlight current line
vim.g.cursorline = true

-- Enable filetype plugins
vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')

-- Clipboard
if vim.fn.has('unnamedplus') then
    vim.g.clipboard = 'unnamedplus'
else
    vim.g.clipboard = 'unnamed'
end

vim.g.NERDTreeMapOpenInTab = '<ENTER>'
