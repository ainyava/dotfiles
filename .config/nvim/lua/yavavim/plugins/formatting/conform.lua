return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      go = { "goimports", "gofmt" },
      rust = { "rustfmt" },
      python = { "ruff_format" },
      ["*"] = { "cspell" },
      ["_"] = { "trim_whitespace" },
    },
  },
}
