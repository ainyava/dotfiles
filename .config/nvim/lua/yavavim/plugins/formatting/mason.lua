return {
    "mason-org/mason.nvim",
    cond = vim.g.use_mason and not vim.g.vscode,
    opts = {}
}