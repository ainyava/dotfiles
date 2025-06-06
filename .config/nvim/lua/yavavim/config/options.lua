local opt = vim.opt

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Auto format
vim.g.autoformat = true

-- Completions
vim.g.ai_cmp = true

-- Root directory
vim.g.root_spec = { "cwd", "lsp", { ".git", "lua" } }
vim.g.root_lsp_ignore = { "copilot" }

-- Hide deprecation warnings
vim.g.deprecation_warnings = false

-- Show the current document symbols location from Trouble in lualine
-- You can disable this for a buffer by setting `vim.b.trouble_lualine = false`
vim.g.trouble_lualine = true

-- Auto update external writes
opt.autoread = true

-- Enable auto write
opt.autowrite = true

-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"

-- Hide * markup for bold and italic, but not markers with substitutions
opt.conceallevel = 2

-- Confirm to save changes before exiting modified buffer
opt.confirm = true

-- Enable highlighting of the current line
opt.cursorline = true

-- Use spaces instead of tabs
opt.expandtab = true
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.foldlevel = 99-- 
opt.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

-- Ignore case
opt.ignorecase = true

-- preview incremental substitute
opt.inccommand = "nosplit"
opt.jumpoptions = "view"

-- global statusline
opt.laststatus = 3

-- Wrap lines at convenient points
opt.linebreak = true

-- Show some invisible characters (tabs...
opt.list = true

-- Enable mouse mode
opt.mouse = "a"

-- Print line number
opt.number = true

-- Popup blend
opt.pumblend = 10

-- Maximum number of entries in a popup
opt.pumheight = 10

-- Relative line numbers
opt.relativenumber = true


-- Disable the default ruler
opt.ruler = false

-- Lines of context
opt.scrolloff = 4
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

-- Round indent
opt.shiftround = true

-- Size of an indent
opt.shiftwidth = 2
opt.shortmess:append({ W = true, I = true, c = true, C = true })

-- Dont show mode since we have a statusline
opt.showmode = false

-- Columns of context
opt.sidescrolloff = 8

-- Always show the signcolumn, otherwise it would shift the text each time
opt.signcolumn = "yes"

-- Don't ignore case with capitals
opt.smartcase = true

-- Insert indents automatically
opt.smartindent = true
opt.spelllang = { "en" }

-- Put new windows below current
opt.splitbelow = true

-- Put new windows right of current
opt.splitright = true
opt.splitkeep = "screen"
opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]

-- Number of spaces tabs count for
opt.tabstop = 2

-- True color support
opt.termguicolors = true

-- Lower than default (1000) to quickly trigger which-key
opt.timeoutlen = vim.g.vscode and 1000 or 300
opt.undofile = true
opt.undolevels = 10000

-- Save swap file and trigger CursorHold
opt.updatetime = 200

-- Allow cursor to move where there is no text in visual block mode
opt.virtualedit = "block"

-- Command-line completion mode
opt.wildmode = "longest:full,full"

-- Minimum window width
opt.winminwidth = 5

-- Disable line wrap
opt.wrap = false
opt.smoothscroll = true
opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
opt.foldmethod = "expr"
opt.foldtext = ""

-- Configure backspace so it acts as it should act
opt.backspace = "eol,start,indent"

-- Highlight search
opt.hlsearch = true

-- Enable filetype plugins
vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")


-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0


-- Disable snacks animations
vim.g.snacks_animate = false
