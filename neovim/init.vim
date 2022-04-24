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

require('plugins')

-- Tree Sitter
require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "go", "python", "bash", "css", "html", "javascript", "json", "lua", "typescript", "html", "dockerfile", "vim" },
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    indent = {
        enable = true
    }
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

require("null-ls").setup({
    sources = {
        require("null-ls").builtins.diagnostics.vale,
    },  
})

EOF

" Telescope Setup
nnoremap ø <cmd>Telescope find_files<cr>
nnoremap ; <cmd>Telescope buffers<cr>
nnoremap ƒ <cmd>Telescope live_grep<cr>

" Trouble Setup
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
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
