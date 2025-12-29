return {
  -- Completion (fast, modern)
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      keymap = { preset = "default" },
      appearance = { nerd_font_variant = "mono" },
      completion = { documentation = { auto_show = false } },
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },

  -- LSP tooling
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = {
        "gopls",
        "ts_ls",
        "pyright",
        "html",
        "cssls",
        "jsonls",
        "yamlls",
        "marksman",
      },
      -- Default is automatic enable; we keep it, but scoped to known servers.
      automatic_enable = {
        "gopls",
        "ts_ls",
        "pyright",
        "html",
        "cssls",
        "jsonls",
        "yamlls",
        "marksman",
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim", "mason-org/mason-lspconfig.nvim" },
    opts = {
      ensure_installed = {
        -- formatters
        "prettier",
        "gofumpt",
        "goimports",
        "ruff",

        -- optional but useful
        "golangci-lint",
      },
      auto_update = false,
      run_on_start = true,
    },
  },

  -- Format on save
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = function(bufnr)
        return {
          timeout_ms = 2000,
          lsp_fallback = true,
          bufnr = bufnr,
          callback = function()
            vim.schedule(function()
              vim.highlight.on_yank({
                higroup = "Visual",
                timeout = 120,
              })
            end)
          end,
        }
      end,
      formatters_by_ft = {
        go = { "goimports", "gofumpt" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        python = { "ruff_format" },
      },
    },
    keys = {
      { "<leader>cf", function() require("conform").format({ lsp_fallback = true }) end, desc = "Format buffer" },
    },
  },
}

