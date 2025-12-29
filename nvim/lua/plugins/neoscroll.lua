return {
  {
    "karb94/neoscroll.nvim",

    -- Load only once scrolling happens
    event = "WinScrolled",

    opts = {
      -- Which keys neoscroll should handle
      mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>" },

      -- UX details
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = true,

      -- Animation style (subtle, professional)
      easing_function = "quadratic",
    },
  },
}
