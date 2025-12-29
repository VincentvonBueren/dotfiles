return {
  {
    "numToStr/Comment.nvim",

    -- Load lazily after startup settles
    event = "VeryLazy",

    -- opts = {} means:
    -- Lazy will automatically call:
    -- require("Comment").setup(opts)
    opts = {
      padding = true,   -- space after comment delimiters
      sticky = true,    -- cursor stays in place
      ignore = "^$",    -- don't comment empty lines
      mappings = {
        basic = true,   -- gcc, gc
        extra = true,   -- gco, gcO, gcA
      },
    },
  },
}
