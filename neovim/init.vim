scriptencoding utf-8
source ~/.config/nvim/plugins.vim

set nocompatible
filetype plugin on
syntax enable

set number

set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

set nowrap

set clipboard=unnamedplus
" https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl

"Switching between buffers
nnoremap <silent> gn :bn<cr>
nnoremap <silent> gp :bp<cr>
nnoremap <silent> gd :bd<cr>

let g:python3_host_prog = '/home/vineeth/.pyenv/versions/3.8.2/bin/python'

" ============================================================================ "
" ===                           Plugin Setup                               === "
" ============================================================================ "
lua <<EOF
-- Tree Sitter
require 'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true,
    },

}

-- Lualine 
require('lualine').setup {
    options = {
        theme = 'tokyonight'
    }
}

-- LSP Config
require('lsp')

EOF

" Telescope Setup
nnoremap 😊 <cmd>Telescope find_files<cr>
nnoremap ;  <cmd>Telescope buffers<cr>
nnoremap 📁 <cmd>Telescope live_grep<cr>


" ============================================================================ "
" ===                                UI                                    === "
" ============================================================================ "

if has('nvim') || has('termguicolors')
  set termguicolors
endif

set background=dark

colorscheme tokyonight

" Bracket Matching Colors
hi MatchParen guibg=grey

set guifont=FuraMono\ NF:h16
set encoding=utf8

set mouse=a
