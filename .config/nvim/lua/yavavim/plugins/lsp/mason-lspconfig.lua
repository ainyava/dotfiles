return {
    "mason-org/mason-lspconfig.nvim",
    enabled = vim.g.use_mason,
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}