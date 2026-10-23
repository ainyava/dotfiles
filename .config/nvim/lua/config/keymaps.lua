local map = vim.keymap.set

-- Personal shortcuts loaded after LazyVim's defaults.
vim.g.loaded_ctrlp = 1
map({ "n", "i", "v" }, "<A-Down>", "<A-j>", { remap = true })
map({ "n", "i", "v" }, "<A-Up>", "<A-k>", { remap = true })
map({ "n", "i", "v" }, "<C-p>", function() Snacks.picker.files() end, { desc = "Find Files" })
map({ "n", "i", "v" }, "<C-b>", function() Snacks.explorer() end, { desc = "File Explorer" })
map("n", "<leader>gl", function() Snacks.picker.git_log({ cwd = LazyVim.root() }) end, { desc = "Git Log (Root Dir)" })
map("n", "<leader>ft", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })
map("n", "<c-/>", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })
map("n", "<c-_>", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "which_key_ignore" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<C-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })
