return {
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    opts = {
      -- Explicit path to a user-local binary
      cmd = vim.fn.expand("~/.local/bin/mcp-hub"),
      auto_start = true,
      log_level = "warn",
    },
  },
}
