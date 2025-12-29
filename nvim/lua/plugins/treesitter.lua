return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false, -- REQUIRED (new Treesitter rewrite)
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "go",
        "gomod",
        "gowork",
        "gosum",

        "javascript",
        "typescript",
        "tsx",

        "python",

        "html",
        "css",
        "json",
        "yaml",
        "markdown",
        "markdown_inline",

        "bash",
        "lua",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}

