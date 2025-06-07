return {
  -- Syntax highlight
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "ninja", "rst", "python" } },
  },
  -- lspconfig
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "pyright", "ruff", "ruff-lsp"},
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "pyright", "ruff" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function(_, opts)
      vim.lsp.enable('basedpyright')
      vim.lsp.enable('pyright')
      vim.lsp.enable('ruff')
      vim.lsp.enable('ruff_lsp')
    end
  },
  {
    "folke/which-key.nvim", -- Optional, for better keybinding documentation
    event = "VeryLazy",
    init = function()
      vim.keymap.set("n", "<leader>co", function()
        vim.lsp.buf.code_action({
          context = {
            only = { "source.organizeImports" },
            diagnostics = {}
          },
          apply = true,
        })
      end, { desc = "Organize Imports" })
    end,
  },
  -- tests
  {
    "nvim-neotest/neotest-python",
  },
  -- debugger
  {
    "mfussenegger/nvim-dap-python",
    -- stylua: ignore
    keys = {
      { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method", ft = "python" },
      { "<leader>dPc", function() require('dap-python').test_class() end,  desc = "Debug Class",  ft = "python" },
    },
  },
  -- venv selector
  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp", -- Use this branch for the new version
    cmd = "VenvSelect",
    enabled = true,
    opts = {
      settings = {
        options = {
          notify_user_on_venv_activation = true,
        },
      },
    },
    --  Call config for python files and load the cached venv automatically
    ft = "python",
    keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv", ft = "python" } },
  },
}
