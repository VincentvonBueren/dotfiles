return {
  {
    "yetone/avante.nvim",

    -- Native backend (recommended)
    build = vim.fn.has("win32") ~= 0
      and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",

    event = "VeryLazy",
    version = false, -- NEVER set to "*"

    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim", -- optional but useful
      "nvim-tree/nvim-web-devicons",
    },

    opts = {
      ------------------------------------------------------------------
      -- Optional per-project instructions
      ------------------------------------------------------------------
      instructions_file = "avante.md",

      ------------------------------------------------------------------
      -- Provider selection (LATEST STYLE)
      ------------------------------------------------------------------
      provider = "openai",

      providers = {
        openai = {
          model = "gpt-4.1-mini",
          timeout = 30000,
          extra_request_body = {
            temperature = 0.2,
            max_tokens = 16384,
          },
        },
      },

      ------------------------------------------------------------------
      -- Behavior (explicit, no Copilot magic)
      ------------------------------------------------------------------
      auto_suggestions = false,
      auto_apply_diff = false,

      ------------------------------------------------------------------
      -- UI
      ------------------------------------------------------------------
      window = {
        layout = "vertical",
        width = 0.4,
      },
    },

    --------------------------------------------------------------------
    -- Explicit keybindings (AstroNvim-style, but controlled)
    --------------------------------------------------------------------
    keys = {
      {
        "<leader>aa",
        function()
          require("avante.api").ask()
        end,
        desc = "Avante: Ask AI",
      },
      {
        "<leader>ae",
        function()
          require("avante.api").edit()
        end,
        desc = "Avante: Edit selection",
        mode = { "n", "v" },
      },
    },
  },
}
