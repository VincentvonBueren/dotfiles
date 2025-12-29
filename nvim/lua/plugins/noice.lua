return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",

    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },

    opts = {
      ------------------------------------------------------------------
      -- Command line UI (CENTERED)
      ------------------------------------------------------------------
      cmdline = {
        view = "cmdline_popup",
        format = {
          cmdline = { icon = "" },
          search_down = { icon = " " },
          search_up = { icon = " " },
        },
      },

      ------------------------------------------------------------------
      -- Message handling
      ------------------------------------------------------------------
      messages = {
        enabled = true,
      },

      ------------------------------------------------------------------
      -- IMPORTANT: do NOT touch completion (blink.cmp)
      ------------------------------------------------------------------
      popupmenu = {
        enabled = false,
      },

      ------------------------------------------------------------------
      -- IMPORTANT: do NOT override LSP UI (Avante later)
      ------------------------------------------------------------------
      lsp = {
        progress = {
          enabled = false,
        },
        hover = {
          enabled = false,
        },
        signature = {
          enabled = false,
        },
      },

      ------------------------------------------------------------------
      -- Presets (safe + minimal)
      ------------------------------------------------------------------
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },

      ------------------------------------------------------------------
      -- Views: CENTER the cmdline popup
      ------------------------------------------------------------------
      views = {
        cmdline_popup = {
          position = {
            row = "50%",
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
          border = {
            style = "rounded",
          },
        },
      },
    },
  },
}
