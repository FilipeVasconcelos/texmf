":set viminfo='20,<1000,s10,h
syntax on
filetype indent plugin on
let fortran_free_source=1
let fortran_have_tabs=1
set laststatus=2
set viminfo='20,<1000
"unnecessary with lightline plugin
"set noshowmode

"Détection du type de fichier pour l'indentation
if has("autocmd")
  filetype indent on
" .m files are "octave" files
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Use keywords from Octave syntax language file for autocomplete
    if exists("+omnifunc")
        autocmd Filetype octave
       \ if &omnifunc == "" |
       \ setlocal omnifunc=syntaxcomplete#Complete |
       \ endif
    endif 
endif

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
"set pastetoggle=<F2>


call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/wombat256.vim'
Plug 'vim-scripts/Zenburn'
Plug 'mikewest/vim-markdown'
"Plug 'aonemd/kuroi.vim'
call plug#end()


set t_Co=256
"colorscheme wombat256mod
"let g:solarized_termcolors=256
"syntax enable
"set background=dark
"colorscheme solarized
colorscheme gruvbox
"colorscheme zenburn
"set termguicolors
set background=dark
"colorscheme kuroi
if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif
