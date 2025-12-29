return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
      { "<leader>fb", function()
          require("telescope.builtin").buffers({
            sort_lastused = true,
            ignore_current_buffer = true,
            previewer = false,
          })
        end,
        desc = "Buffers"
      },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help" },
      {
        "<leader>tb",
        function()
          require("telescope.builtin").buffers({
            sort_lastused = true,
            ignore_current_buffer = false,
            previewer = false,
          })
        end,
        desc = "Tab-like buffer picker",
      },
    },
    opts = {},
  },
}

