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

" set clipboard+=unnamedplus " for MacOS

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

"Switching between buffers
nnoremap <silent> gn :bn<cr>
nnoremap <silent> gp :bp<cr>
nnoremap <silent> gd :bd<cr>

let g:python3_host_prog = '/home/vineeth/.pyenv/versions/3.8.2/bin/python'

" ============================================================================ "
" ===                        Language Specific                             === "
" ============================================================================ "

" JS Tigris
let g:tigris#enabled = 1
let g:tigris#on_the_fly_enabled = 1
let g:tigris#delay = 500

autocmd Filetype javascript setlocal shiftwidth=2 softtabstop=2 expandtab

" Scala Syntax highlighting
au BufRead,BufNewfile *.sbt set filetype=scala
" ============================================================================ "
" ===                                UI                                    === "
" ============================================================================ "

if has('nvim') || has('termguicolors')
  set termguicolors
endif

set background=dark

let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

colorscheme OceanicNext

" Bracket Matching Colors
hi MatchParen guibg=grey

"Vim airline theme
let g:airline_theme='oceanicnext'

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

set guifont=FuraMono\ NF:h16
set encoding=utf8

set mouse=a

" ============================================================================ "
" ===                           Plugin Setup                               === "
" ============================================================================ "
try 
"====================="
" === Denite setup ==="
"====================="

" Use ripgrep for searching current directory for files
" By default, ripgrep will respect rules in .gitignore
"   --files: Print each file that would be searched (but don't search)
"   --glob:  Include or exclues files for searching that match the given glob
"            (aka ignore .git files)
"
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Use ripgrep in place of 'grep'
call denite#custom#var('grep', 'command', ['rg'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep','--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'split': 'floating',
\ 'start_filter': 1,
\ 'auto_resize': 1,
\ 'source_names': 'short',
\ 'prompt': 'λ:',
\ 'statusline': 0,
\ 'winrow': 1,
\ 'vertical_preview': 1
\ }}
 
 
" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction
 
 
call s:profile(s:denite_options)
catch
  echo 'Denite not installed. It should work after running :PlugInstall'
endtry
 
" === Denite shorcuts === "
"   ;         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and close window if no results
"   <leader>j - Search current directory for occurences of word under cursor

"execute "set <A-o>=<Esc>[;O"
"execute "set <A-S-o>=<Esc>[;O;S"
"execute "set <A-f>=<Esc>[;F"
"execute "set <A-j>=<Esc>[;J"

nmap ; :Denite buffer<CR>
" Alt+O
nmap [;O :Denite file/rec<CR>
" Alt+F
nmap [;O;S :DeniteProjectDir file/rec<CR>
nnoremap [;F :<C-u>Denite grep:. -no-empty<CR>
" Alt+j
nnoremap [;J  :<C-u>DeniteCursorWord grep:.<CR>
 
" Define mappings while in 'filter' mode
"   <C-o>         - Switch to normal mode inside of search results
"   <Esc>         - Exit denite window in any mode
"   <CR>          - Open currently selected file in any mode
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o>
  \ <Plug>(denite_filter_quit)
  inoremap <silent><buffer><expr> <c-t>
  \ denite#do_map('do_action', 'tabopen')
  inoremap <silent><buffer><expr> <c-v>
  \ denite#do_map('do_action', 'vsplit')
  inoremap <silent><buffer><expr> <c-h>
  \ denite#do_map('do_action', 'split')
  inoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  inoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
endfunction
 
" Define mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <c-v>
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <c-h>
  \ denite#do_map('do_action', 'split')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-o>
  \ denite#do_map('open_filter_buffer')
endfunction


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


