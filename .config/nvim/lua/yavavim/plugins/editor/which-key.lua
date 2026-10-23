return {
  "folke/which-key.nvim",
  opts = {
    preset = "helix",
    spec = {
      { "<leader>f", group = "file/find" },
      { "<leader>q", group = "quit/session" },
      { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
    },
  },
}
