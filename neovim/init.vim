scriptencoding utf-8

" default in neovim 
" filetype plugin on
" syntax enable

set number

set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

set nowrap

set clipboard=unnamedplus
" https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl

" let mapleader=","

"Switching between buffers
nnoremap <silent> gn :bn<cr>
nnoremap <silent> gp :bp<cr>
nnoremap <silent> gd :bd<cr>

let g:coq_settings = { 'auto_start': 'shut-up' }
let g:python3_host_prog = '/Users/vineeth/.config/nvim/venv/bin/python'

" ============================================================================ "
" ===                           Plugin Setup                               === "
" ============================================================================ "
lua <<EOF

require('plugins').setup()
require('impatient')

EOF

set completeopt=menuone,noinsert,noselect
" set shortmess+=c

" ============================================================================ "
" ===                                UI                                    === "
" ============================================================================ "

if has('nvim') || has('termguicolors')
  set termguicolors
endif

set background=dark

" colorscheme tokyonight

" Bracket Matching Colors
hi MatchParen guibg=grey

set encoding=utf8
set mouse-=a
