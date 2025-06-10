return {
  desc = "Snacks File Explorer",
  cond = not vim.g.vscode,
  recommended = true,
  "folke/snacks.nvim",
  opts = { explorer = {} },
  keys = {
    {
      "<leader>fe",
      function()
        Snacks.explorer()
      end,
      desc = "Explorer Snacks (cwd)",
    },
    {
      "<leader>fE",
      function()
        Snacks.explorer({ cwd = YavaVim.root() })
      end,
      desc = "Explorer Snacks (root dir)",
    },
    { "<leader>e", "<leader>fe", desc = "Explorer Snacks (cwd)", remap = true },
    { "<leader>E", "<leader>fE", desc = "Explorer Snacks (root dir)",      remap = true },
  },
}
