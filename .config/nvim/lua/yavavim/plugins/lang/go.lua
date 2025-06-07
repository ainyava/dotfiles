return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "go", "gomod", "gowork", "gosum" } },
  },
  {
    "neovim/nvim-lspconfig",
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
  -- {
  --   "leoluz/nvim-dap-go",
  --   opts = {},
  -- },
  -- {
  --   "fredrikaverpil/neotest-golang",
  -- },
  -- {
  --   "echasnovski/mini.icons",
  --   opts = {
  --     file = {
  --       [".go-version"] = { glyph = "", hl = "MiniIconsBlue" },
  --     },
  --     filetype = {
  --       gotmpl = { glyph = "󰟓", hl = "MiniIconsGrey" },
  --     },
  --   },
  -- },
}
