local lspconfig = require'lspconfig'

lspconfig.ccls.setup {
    init_options = {
        compilationDatabaseDirectory = "build";
        index = {
            threads = 0;
        };
        clang = {
            excludeArgs = { "-frounding-math"};
        };
    }
}

lspconfig.tsserver.setup{} -- TypeScript and JavaScript Language Server
lspconfig.pyright.setup{}  -- Python Language Server
