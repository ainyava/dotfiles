return {
  "navarasu/onedark.nvim",
  priority = 1000, -- Ensure it loads first
  opts = {
    style = 'warmer',
    transparent = true,
  },
  config = function(_, opts)
    require('onedark').setup(opts)
    require('onedark').load()
  end
}
