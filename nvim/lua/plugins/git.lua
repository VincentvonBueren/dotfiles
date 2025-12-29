return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add          = { text = "│" },
        change       = { text = "│" },
        delete       = { text = "_" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
      },
      current_line_blame = false,
      on_attach = function(bufnr)
        local map = vim.keymap.set
        local gs = package.loaded.gitsigns

        -- Navigation
        map("n", "]c", gs.next_hunk, { buffer = bufnr, desc = "Next hunk" })
        map("n", "[c", gs.prev_hunk, { buffer = bufnr, desc = "Prev hunk" })

        -- Actions
        map("n", "<leader>hs", gs.stage_hunk, { buffer = bufnr, desc = "Stage hunk" })
        map("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr, desc = "Reset hunk" })
        map("v", "<leader>hs", function() gs.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end,
          { buffer = bufnr, desc = "Stage hunk" })
        map("v", "<leader>hr", function() gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end,
          { buffer = bufnr, desc = "Reset hunk" })

        map("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr, desc = "Preview hunk" })
        map("n", "<leader>hb", gs.blame_line, { buffer = bufnr, desc = "Blame line" })
        map("n", "<leader>hd", gs.diffthis, { buffer = bufnr, desc = "Diff this" })
      end,
    },
  },
}
