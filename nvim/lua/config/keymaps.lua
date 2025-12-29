local map = vim.keymap.set

-- Better defaults
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Primagen-style comfort
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Clipboard (macOS works with unnamedplus)
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank line to clipboard" })

-- “Paste without losing yank”
map("x", "<leader>p", [["_dP]], { desc = "Paste (keep register)" })

-- Quick buffer switch
map("n", "<leader><leader>", "<C-^>", { desc = "Alternate buffer" })

-- Save file
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })

-- Save file
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })

-- Save all files
vim.keymap.set("n", "<leader>W", "<cmd>wa<CR>", { desc = "Save all files" })

-- Paste and reindent (NON-recursive, safe)
vim.keymap.set("n", "<leader>P", "<cmd>normal! p==<CR>", { desc = "Paste and reindent" })
vim.keymap.set("n", "<leader>O", "<cmd>normal! P==<CR>", { desc = "Paste above and reindent" })

-- Window navigation (AstroNvim-style)
vim.keymap.set("n", "<leader>o", "<C-w>", { desc = "Window actions" })

-- Delete current buffer (keep window)
vim.keymap.set("n", "<leader>td", function()
  vim.cmd("bdelete")
end, { desc = "Delete current buffer" })

vim.keymap.set("n", "<leader>to", function()
  local current = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current and vim.api.nvim_buf_is_loaded(buf) then
      vim.api.nvim_buf_delete(buf, { force = false })
    end
  end
end, { desc = "Tab only (close others)" })

vim.keymap.set("n", "<leader>tn", ":bnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<leader>tp", ":bprevious<CR>", { desc = "Previous tab" })
