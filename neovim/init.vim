scriptencoding utf-8
" source ~/.config/nvim/plugins.vim

" lua require('plugins')

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

let g:coq_settings = { 'auto_start': 'shut-up' }
" let g:python3_host_prog = '/home/vineeth/.pyenv/versions/3.8.2/bin/python'

" ============================================================================ "
" ===                           Plugin Setup                               === "
" ============================================================================ "
lua <<EOF

require('plugins')

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

require('impatient')

-- LSP Config
require('lsp')

require("indent_blankline").setup {
    char = "|",
    buftype_exclude = {"terminal"}
}

require("trouble").setup {}

EOF

" Telescope Setup
nnoremap ø <cmd>Telescope find_files<cr>
nnoremap ; <cmd>Telescope buffers<cr>
nnoremap ƒ <cmd>Telescope live_grep<cr>

" Trouble Setup
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>


nnoremap <leader>jq :%!python -m json.tool<cr>

" Completion Setup -- can enable following line if you want it to work on ever
" extension
" autocmd BufEnter * lua require'completion'.on_attach()

set completeopt=menuone,noinsert,noselect
set shortmess+=c

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

set encoding=utf8

set mouse=a
