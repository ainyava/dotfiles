-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
    end,
},
window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
}),
sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
}, {
    { name = 'buffer' },
})
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
    { name = 'git' },
}, {
    { name = 'buffer' },
})
})
require("cmp_git").setup() ]]-- 

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
mapping = cmp.mapping.preset.cmdline(),
sources = {
    { name = 'buffer' }
}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
mapping = cmp.mapping.preset.cmdline(),
sources = cmp.config.sources({
    { name = 'path' }
}, {
    { name = 'cmdline' }
}),
matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

--- Languages setup ---
require('packer').startup(function(use) 
    --packer
    use 'wbthomason/packer.nvim'

    --lsp
    use 'neovim/nvim-lspconfig'

    --auto complete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    --
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    vim.opt.completeopt = { "menu", "menuone", "noselect" }
end)

local has_words_before = function()
local line, col = unpack(vim.api.nvim_win_get_cursor(0))
return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end


local cmp = require('cmp')

cmp.setup({
snippet = {
    expand = function(args)
    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
},
mapping = {
    -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
        cmp.select_next_item()
    elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
    elseif has_words_before() then
        cmp.complete()
    else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
    end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function()
    if cmp.visible() then
        cmp.select_prev_item()
    elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
    end
    end, { "i", "s" }),
},
sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
}, {
    { name = 'buffer' },
})
})


local capabilities = require('cmp_nvim_lsp').default_capabilities() --nvim-cmp

local on_attach = function(client, bufnr)
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Setup lspconfig.
local nvim_lsp = require('lspconfig')

-- setup languages 
-- GoLang
nvim_lsp['gopls'].setup{
    cmd = {'gopls'},
    -- on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      gopls = {
        experimentalPostfixCompletions = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
      },
    },
    init_options = {
      usePlaceholders = true,
    }
  }
-- Rust
local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n", 
  "<leader>a", 
  function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  { silent = true, buffer = bufnr }
)
-- python
-- Setup LSP with nvim-cmp capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Ensure the LSP servers you want are installed using mason
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "pyright", "ruff_lsp" }
})

-- Setup pyright with LSP capabilities
require('lspconfig').pyright.setup {
    capabilities = capabilities
}

-- Setup ruff-lsp
require('lspconfig').ruff_lsp.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        -- Optional: Disable Pyright's linting since Ruff is handling that
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
    init_options = {
        settings = {
            -- Adjust your Ruff settings here, such as rules or severity levels
        }
    }
}
require('formatter').setup({
  filetype = {
    python = {
      -- Use ruff for formatting Python files
      function()
        return {
          exe = "ruff", -- ensure `ruff` is in your PATH
          args = {"check", "--fix", "--exit-zero", "--no-cache", "--quiet", vim.api.nvim_buf_get_name(0)},
          stdin = false,
        }
      end,
    },
  },
})
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
        group = "__formatter__",
        pattern = "*.py",
        command = ":lua vim.lsp.buf.format()",
})

