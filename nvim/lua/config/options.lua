vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

vim.opt.clipboard = "unnamedplus"

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.updatetime = 250

-- Keep cursor away from window edges
vim.opt.scrolloff = 20
vim.opt.sidescrolloff = 8
vim.opt.timeoutlen = 400

vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

-- Soft visual margins
vim.opt.signcolumn = "yes:1"

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Diagnostics: Neovim 0.11 changed some defaults; set what you want explicitly.
vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
  float = { border = "rounded" },
})
