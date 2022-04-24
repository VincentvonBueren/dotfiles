local lspconfig = require'lspconfig'
local coq = require'coq'

-- Autoformat the buffer on write using the language server definition
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

lspconfig.ccls.setup {
    coq.lsp_ensure_capabilities,
    init_options = {
        compilationDatabaseDirectory = "build";
        index = {
            threads = 0;
        };
        clang = {
            excludeArgs = { "-frounding-math"};
        };
    },
}

lspconfig.tsserver.setup{coq.lsp_ensure_capabilities} -- TypeScript and JavaScript Language Server
lspconfig.pyright.setup{coq.lsp_ensure_capabilities}  -- Python Language Server
