-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Disable default CtrlP
vim.g.loaded_ctrlp = 1

local keyset = vim.keymap.set
local command = vim.api.nvim_command

-- Telescope
local telescope_builtin = require("telescope.builtin")
keyset("n", "<C-p>", telescope_builtin.find_files, {})

-- NvimTree
vim.keymap.set("n", "<C-b>", "<Cmd>Neotree toggle<CR>")
