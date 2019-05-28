scriptencoding utf-8
source ~/AppData/Local/nvim/plugins.vim

set nocompatible
filetype plugin on
syntax on

set number
set clipboard=unnamed

set softtabstop=2
set shiftwidth=2
set nowrap

"Switching between buffers
nnoremap <silent> gn :bn<cr>
nnoremap <silent> gp :bp<cr>
nnoremap <silent> gd :bd<cr>

highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

let g:python3_host_prog = 'C:\Users\18vvo\AppData\Local\Programs\Python\Python37\python.exe'


let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" ============================================================================ "
" ===                           Plugin Setup                               === "
" ============================================================================ "
"NerdTree Configuration

nnoremap NT :NERDTree<cr>

"Coc Configuration
set updatetime=300
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Vim Wiki 
"set foldmethod=syntax
let g:vimwiki_folding='list'

" ============================================================================ "
" ===                        Syntax Highlighting                           === "
" ============================================================================ "

" Python Semshi
" C Chromatica

" JS Tigris
let g:tigris#enabled = 1
let g:tigris#on_the_fly_enabled = 1
let g:tigris#delay = 500
" ============================================================================ "
" ===                                UI                                    === "
" ============================================================================ "

if has('nvim') || has('termguicolors')
  set termguicolors
endif

set background=dark

colorscheme challenger_deep


" Vim wiki Header Colors
hi VimwikiHeader1 guifg=#FF8080
hi VimwikiHeader2 guifg=#91DDFF
hi VimwikiHeader3 guifg=#95FFA4
hi VimwikiHeader4 guifg=#C991E1
hi VimwikiHeader5 guifg=#FF5458
hi VimwikiHeader6 guifg=#65B2FF

" Bracket Matching Colors
hi MatchParen guibg=grey



"Vim airline theme
let g:airline_theme='challenger_deep'

set guifont=Hack\ NF:h16
set encoding=utf8

"Devicons setup
"let g:airline_powerline_fonts = 1
"let g:webdevicons_enable = 1
"let g:webdevicons_enable_nerdtree = 1
"let g:webdevicons_enable_denite = 1
"let g:webdevicons_enable_airline_tabline = 1

"if exists("g:loaded_webdevicons")
" call webdevicons#refresh()
"endif
