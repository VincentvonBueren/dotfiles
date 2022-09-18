local lspconfig = require 'lspconfig'
-- local mason_lspconfig = require 'mason-lspconfig'
local coq = require 'coq'

-- Autoformat the buffer on write using the language server definition
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
vim.cmd [[autocmd BufWritePre * ggVGgq]]

local servers = {
    ccls = {
        init_options = {
            compilationDatabaseDirectory = "build";
            index = {
                threads = 0;
            };
            clang = {
                excludeArgs = { "-frounding-math" };
            };
        }
    },
    tsserver = {},
    pyright = {},
    sumneko_lua = {
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { 'vim', 'packer_plugins' },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        }
    },
    prismals = {},
    prosemd_lsp = {
        --         cmd = { "~/.local/share/nvim/mason/bin/prosemd-lsp", "--stdio" },
        filetypes = { "markdown" },
        --         root_dir = function()
        --             return vim.fn.getcwd()
        --         end,
        --         settings = {},
    }
}

for server, opts in pairs(servers) do
    lspconfig[server].setup(coq.lsp_ensure_capabilities(opts))
end

require("mason").setup({})

require("mason-lspconfig").setup({
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = true
})
