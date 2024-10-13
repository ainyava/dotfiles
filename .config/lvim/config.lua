-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- Map Ctrl + p to open Telescope find files
lvim.keys.normal_mode["<C-p>"] = ":Telescope find_files<cr>"

-- Map Ctrl + b to toggle file explorer (nvim-tree)
lvim.keys.normal_mode["<C-b>"] = ":NvimTreeToggle<cr>"

-- Map Ctrl + d to select next occurrence (multi-cursor)
lvim.keys.visual_mode["<C-d>"] = ":lua require('spectre').open_visual()<cr>"
lvim.keys.normal_mode["<C-d>"] = ":lua require('spectre').open()<cr>"

-- Map Ctrl + f to find in the current file
lvim.keys.normal_mode["<C-f>"] = ":Telescope live_grep<cr>"

-- Map Ctrl + w to close the current buffer
lvim.keys.normal_mode["<C-w>"] = ":bd<cr>"

-- Map Ctrl + n to open a new empty buffer
lvim.keys.normal_mode["<C-n>"] = ":enew<cr>"

-- Map Ctrl + ` to toggle terminal
lvim.keys.normal_mode["<C-`>"] = ":ToggleTerm<cr>"

-- Ensure this line is present to load the configurations
lvim.builtin.which_key.mappings = lvim.keys

