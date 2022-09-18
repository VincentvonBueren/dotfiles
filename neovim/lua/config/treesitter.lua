require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "go", "python", "bash", "css", "html", "javascript", "json", "lua", "typescript", "html",
        "dockerfile", "vim" },
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    indent = {
        enable = true
    }
}
