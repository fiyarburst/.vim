"Remember, set variable=x <- no spaces!
" set verbose=1
set nocompatible "get your arrow keys and things back from the default vi-like mode
" set showcmd - shows <Leader>key, which is \ by default.
set showcmd
set number relativenumber
let mapleader = ','
set backspace=indent,eol,start
 "backspace is important,and i think eol makes it work past line ends
set expandtab
set tabstop=4
set sw=4 " shiftwidth is for autoindenting/shifting. both are needed by indent_guides
set hlsearch    "can achieve this with command Nohl nohlsearch
noremap <C-c> :nohlsearch<CR>

set directory=~/.vim/swap//,/tmp/vim/swap//
set ttyfast
set lazyredraw
set wildmenu

"""" Plugins
runtime autoload/pathogen.vim
execute pathogen#infect('bundle/{}', $HOME+'/.vim/bundle/{}')
Helptags

"""" Colors
" need 256-colors, which screen/mintty sometimes screw up
set t_Co=256
let g:solarized_termcolors=256
"sets the default color scheme to not use superdark colors. 
syntax enable
set background=dark
colorscheme slate

"""" indent_guides settings let g:indent_guides_start_level=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=lightgrey  
let g:indent_guides_guide_size= 1
let g:indent_guides_enable_on_vim_startup=0
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0

set maxmempattern=8000
" and i guess i should probably putp documentation about how all my various plugins work.

filetype plugin on 
set hidden
set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <esc><esc> :nohls<CR>
" Then there's dumbass weird quirks like this. Tab maps to <C-i> so there is
" no fkn <C-Tab>. And then the C-S-i mapping doesn't work for who knows what
" reason, so rn i cycle tabs forward with Tab and don't cycle backwards.
"

""" DEFAULT key bindings
" have indent guides installed with default mapping
" map <leader>ig <Plug>IndentGuidesToggle
" <S-z>z apparently saves and quits automatically by default


""" python syntax
set textwidth=120
let g:formatters_python = ['black', 'yapf', 'autopep8']
let g:syntastic_python_checkers = ['black']  " ,  'pyflakes']
let g:formatdef_black = '"black -q ".(&textwidth ? "-l".&textwidth : "")." -"'
let g:syntastic_python_pylint_post_args="--max-line-length=&textwidth"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""" MY Key bindings
" macros!
let @o="zO"
let @p="$zf%"
augroup ftrustlang
    "well this doesn't work
    autocmd FileType rust compiler cargo  
    command Debugrust make run
    autocmd FileType rust map B :Debugrust
augroup end
noremap <space> viw
noremap <C-j> ddp
noremap <C-k> ddkkp
noremap <C-s> :w<CR>
noremap ; : 
noremap \ :Autoformat<CR>
noremap <leader>s :w!<CR>
inoremap <c-u> <esc>viwUea
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>ww :bclose<CR>
" TODO: currently, nocompatible keeps cedit on, which makes Ctrl-F a global mapping to cmdwin.
" "         we overwrite C-f in insert mode, but in command mode, maybe there's a better shortcut? 

"dbext https://mutelight.org/dbext-the-last-sql-client-youll-ever-need
let g:ranger_replace_netrw = 1
let g:dbext_default_profile_Notes = 'type=SQLITE:SQLITE_bin=/usr/local/bin/sqlite3:dbname=/Users/ankeet.presswala/Library/Group\ Containers/group.com.apple.notes/NoteStore.sqlite'
let g:dbext_default_profile='Notes'

" AirlineThemes that i like
" - pink
" hybrid base16
" - bluegreen
" lucius monochrome vice base16_londontube base16_shapeshifter cool
" - red blue black
" zenburn serene simple base16_google 
" - brown grey blue
" base16_mocha base16_summerfruit base16_tomorrow
"

let g:airline_theme = 'serene' 
"let g:airline_theme = 'base16_tomorrow'
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Snippets
"let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsSnippetsDir="~/.vim/bundle/vim-snippets"
set runtimepath+="~/.vim/bundle/vim-snippets/snippets"

set undofile
set undodir=~/.vim/undodir

let g:syntastic_python_python_exec = 'python3'

" Clojure
let g:rainbow_active = 1

" tidal
autocmd FileType tidal setlocal commentstring=--\ %s

" turn on autosave
"  autocmd TextChanged,TextChangedI <buffer> silent write
"
highlight DiffAdd    cterm=NONE ctermfg=0 ctermbg=2
highlight DiffDelete cterm=NONE ctermfg=0 ctermbg=1
highlight DiffChange cterm=NONE ctermfg=0 ctermbg=6
highlight DiffText   cterm=NONE ctermfg=0 ctermbg=6

" sr writes file with sudo
"nnoremap <leader>sr :w !sudo tee %<CR>

