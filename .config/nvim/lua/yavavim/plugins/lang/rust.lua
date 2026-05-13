return {
  -- Syntax highlight
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "rust", "ron" } },
  },
  -- Rust LSP + tooling (handles rust-analyzer setup, prefers rustup's rust-analyzer)
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = { "rust" },
    opts = {
      server = {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              buildScripts = { enable = true },
            },
            checkOnSave = true,
            procMacro = { enable = true },
          },
        },
      },
    },
    config = function(_, opts)
      vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts)
    end,
  },
  -- DAP: codelldb debugger
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "codelldb" } },
      },
    },
    config = function()
      local dap = require("dap")
      local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/codelldb"
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = mason_bin,
          args = { "--port", "${port}" },
        },
      }
      dap.configurations.rust = {
        {
          name = "Launch",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
    end,
  },
}
