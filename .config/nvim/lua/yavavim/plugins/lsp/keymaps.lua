return {
    "folke/which-key.nvim",
    keys = {
      { "<leader>cl", function() Snacks.picker.lsp_config() end, desc = "Lsp Info" },
      { "gd", vim.lsp.buf.definition, desc = "Goto Definition", },
      { "gr", vim.lsp.buf.references, desc = "References", nowait = true },
      { "gI", vim.lsp.buf.implementation, desc = "Goto Implementation" },
      { "gy", vim.lsp.buf.type_definition, desc = "Goto T[y]pe Definition" },
      { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
      { "K", vim.lsp.buf.hover, desc = "Hover" },
      { "gK", vim.lsp.buf.signature_help, desc = "Signature Help", },
      { "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help", },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, },
      { "<leader>cc", vim.lsp.codelens.run, desc = "Run Codelens", mode = { "n", "v" }, },
      { "<leader>cC", vim.lsp.codelens.refresh, desc = "Refresh & Display Codelens", mode = { "n" }, },
      { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File", mode = { "n" } },
      { "<leader>cr", vim.lsp.buf.rename, desc = "Rename" },
      {
        "]]",
        function() Snacks.words.jump(vim.v.count1) end,
        desc = "Next Reference",
      },
      {
        "[[",
        function() Snacks.words.jump(-vim.v.count1) end,
        desc = "Prev Reference",
      },
      {
        "<a-n>",
        function() Snacks.words.jump(vim.v.count1, true) end,
        desc = "Next Reference",
      },
      {
        "<a-p>",
        function() Snacks.words.jump(-vim.v.count1, true) end,
        desc = "Prev Reference",
      },
    },
  }