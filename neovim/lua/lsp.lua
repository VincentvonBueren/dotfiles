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
    },
    on_attach=require'completion'.on_attach
}

lspconfig.tsserver.setup{on_attach=require'completion'.on_attach} -- TypeScript and JavaScript Language Server
lspconfig.pyright.setup{on_attach=require'completion'.on_attach}  -- Python Language Server
