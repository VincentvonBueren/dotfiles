let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif


call plug#begin('~/.config/nvim/plugged')

"Coc Intellisense installation
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" Denite - Fuzzy finding, buffer management
Plug 'Shougo/denite.nvim'

Plug 'easymotion/vim-easymotion'

" === Git Plugins === "
Plug 'tpope/vim-fugitive'

" === syntax highlighting === "
" Python Syntax highlighting
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" C Syntax highlighting
Plug 'arakashic/chromatica.nvim'

" Javascript Syntax Highlighting
Plug 'othree/yajs.vim'

" Scala Stuff
Plug 'derekwyatt/vim-scala'

" === UI === "
" File explorer
" Plug 'scrooloose/nerdtree'

" Colorscheme
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

Plug 'mhartington/oceanic-next'
Plug 'altercation/vim-colors-solarized'
" Customized vim status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Miscellaneous
Plug 'vimwiki/vimwiki'

" Icons
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

call plug#end()
