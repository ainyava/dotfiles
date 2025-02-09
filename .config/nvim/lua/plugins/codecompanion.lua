return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    strategies = {
      chat = {
        adapter = "ollama",
        keymaps = {
          send = {
            modes = {
              n = { "<CR>" },
              i = nil,
            },
          },
          close = {
            modes = {
              n = "q",
              i = "<c-x>",
            },
          },
          stop = {
            modes = {
              n = "<c-x>",
            },
          },
        },
      },
      inline = {
        adapter = "ollama",
      },
      agent = {
        adapter = "ollama",
      },
    },
    adapters = {
      ollama = function()
        return require("codecompanion.adapters").extend("ollama", {
          schema = {
            model = {
              default = "deepseek-coder-v2:16b",
            },
          },
        })
      end,
    },
  },
}
