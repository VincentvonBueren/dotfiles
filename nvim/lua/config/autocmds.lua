vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)

    local telescope_builtin = require("telescope.builtin")
    local opts = { buffer = ev.buf }
    local map = vim.keymap.set

    map("n", "K", vim.lsp.buf.hover, opts)
    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "gD", vim.lsp.buf.declaration, opts)
    map("n", "gr", vim.lsp.buf.references, opts)
    map("n", "gi", vim.lsp.buf.implementation, opts)
    map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
    map("n", "<leader>cd", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Line diagnostics" }))
    map("n", "[d", vim.diagnostic.goto_prev, opts)
    map("n", "]d", vim.diagnostic.goto_next, opts)

    map("n", "gd", telescope_builtin.lsp_definitions,
      vim.tbl_extend("force", opts, { desc = "Go to definition" }))

    map("n", "gr", telescope_builtin.lsp_references,
      vim.tbl_extend("force", opts, { desc = "References" }))

    map("n", "gi", telescope_builtin.lsp_implementations,
      vim.tbl_extend("force", opts, { desc = "Implementations" }))

    map("n", "<leader>ds", telescope_builtin.lsp_document_symbols,
      vim.tbl_extend("force", opts, { desc = "Document symbols" }))
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 200,
    })
  end,
})

local function flash_buffer()
  vim.highlight.on_yank({
    higroup = "Visual",
    timeout = 120,
  })
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local argv = vim.fn.argv()
    if #argv == 1 and vim.fn.isdirectory(argv[1]) == 1 then
      vim.cmd("enew")
      require("mini.starter").open()
    end
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 and #vim.fn.getbufinfo({ buflisted = 1 }) > 1 then
      vim.cmd("buffer #")
    end
  end,
})
