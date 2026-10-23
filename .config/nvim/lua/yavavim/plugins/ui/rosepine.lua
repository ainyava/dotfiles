return {
  { "LazyVim/LazyVim", opts = { colorscheme = "rose-pine" } },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    opts = {
      styles = { transparency = true, italic = false },
    },
  },
}
