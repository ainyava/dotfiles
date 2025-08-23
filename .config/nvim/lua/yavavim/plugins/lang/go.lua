return {
  -- Synax highlight
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "go", "gomod", "gowork", "gosum" } },
  },
  -- lspconfig
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "gopls", "goimports", "gofumpt"},
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "gopls" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    ft = "go",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              hints = {
                assignVariableTypes = false,
                compositeLiteralFields = false,
                compositeLiteralTypes = false,
                constantValues = false,
                functionTypeParameters = false,
                parameterNames = false,
                rangeVariableTypes = false,
              },
            },
          },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "delve" } },
      },
      {
        "leoluz/nvim-dap-go",
        opts = {},
      },
    },
  },
  {
    "nvim-neotest/neotest",
    enabled = false,
    dependencies = {
      {"fredrikaverpil/neotest-golang"},
      {
        "leoluz/nvim-dap-go",
        opts = {},
      }
    },
    opts = {
      adapters = {
        ["neotest-golang"] = {
          dap_go_enabled = true,
        },
      },
    },
  },
  {
    "echasnovski/mini.icons",
    opts = {
      file = {
        [".go-version"] = { glyph = "", hl = "MiniIconsBlue" },
      },
      filetype = {
        gotmpl = { glyph = "󰟓", hl = "MiniIconsGrey" },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    dependencies = {},
    ft = 'go',
    lazy = true,
    opts = {
      formatters_by_ft = {
        go = { "gofumpt" },
      },
    }
  }
}
