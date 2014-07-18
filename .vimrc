"Remember, set variable=x <- no spaces!
"get your arrow keys and things back from the default vi-like mode
set nocompatible

"sets the default color scheme to not use superdark colors. 
set background=dark
"turns on syntax highlighting
syntax on

"backspace is important,and i think eol makes it work past line ends
set backspace=indent,eol,start

" line numbers
set nu
" nuuuuu

"<tab> turns into number of spaces specified by tabstop.
" shiftwidth is for autoindenting/shifting. both are needed by indent_guides
set expandtab
set tabstop=4
set sw=4

" need 256-colors, which screen/mintty sometimes screw up
set t_Co=256
colorscheme tir_black 

" set showcmd - shows <Leader>key, which is \ by default.
set showcmd
let mapleader = ','
"indent_guides settings
                    
let g:indent_guides_start_level=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=lightgrey  
let g:indent_guides_guide_size= 1
let g:indent_guides_enable_on_vim_startup=0

