local M = {}


function M.setup()
    require("trouble").setup {}

    -- nnoremap <leader>xx <cmd>TroubleToggle<cr>
    -- nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
    -- nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
    -- nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
    -- nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
    -- nnoremap gR <cmd>TroubleToggle lsp_references<cr>

    -- vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
    -- vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { noremap = true })
    -- vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { noremap = true })
    -- vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { noremap = true })
    -- vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { noremap = true })
    -- vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { noremap = true })

    vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
        { silent = true, noremap = true }
    )
    vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
        { silent = true, noremap = true }
    )
    vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
        { silent = true, noremap = true }
    )
    vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
        { silent = true, noremap = true }
    )
    vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
        { silent = true, noremap = true }
    )
    vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
        { silent = true, noremap = true }
    )
end

return M
