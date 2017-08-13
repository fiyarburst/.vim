"Remember, set variable=x <- no spaces!
set nocompatible "get your arrow keys and things back from the default vi-like mode
" set showcmd - shows <Leader>key, which is \ by default.
set showcmd
let mapleader = ','
set backspace=indent,eol,start
 "backspace is important,and i think eol makes it work past line ends
set nu
 " nuuuuu
set expandtab
set tabstop=4
set sw=4 " shiftwidth is for autoindenting/shifting. both are needed by indent_guides
set hlsearch    "can achieve this with command Nohl nohlsearch
set directory=~/.vim/swap//,/tmp/vim/swap//

"""" Plugins
" pacman  <- lol did i write this when i still used gentoo
runtime autoload/pathogen.vim
execute pathogen#infect('bundle/{}', '/Users/ankeet.presswala/linux_dotfiles/.vim/bundle/{}')


"""" Colors
" need 256-colors, which screen/mintty sometimes screw up
set t_Co=256
let g:solarized_termcolors=256
"sets the default color scheme to not use superdark colors. 
syntax enable
set background=dark
"colorscheme shine

"""" indent_guides settings
let g:indent_guides_start_level=1
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

" Setting up eclim http://eclim.org/install.html
filetype plugin on 
set hidden
set incsearch
" Seriously, it's difficult to build up longer workflows because of how much
" more manually I have to do everything. jfc 
" Then there's dumbass weird quirks like this. Tab maps to <C-i> so there is
" no fkn <C-Tab>. And then the C-S-i mapping doesn't work for who knows what
" reason, so rn i cycle tabs forward with Tab and don't cycle backwards.
"

""" DEFAULT key bindings
" have indent guides installed with default mapping
" map <leader>ig <Plug>IndentGuidesToggle
" <S-z>z apparently saves and quits automatically by default


""" MY Key bindings
nnoremap ; :
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
map <C-s> :w<CR>
map <leader>s :w!<CR>
nmap <leader>ww :bclose<CR>
nnoremap - :Unite file -no-split -start-insert<CR>


" speedier file search; vimproc is used to run file_rec/async in the bg
"nnoremap - :Unite file_rec/async -no-split -start-insert<cr>

"
"  " Disable AutoComplPop plugin - make sure ACP is loaded before Unite.vim.
if exists('g:loaded_acp')
    autocmd bufenter unite AcpLock
    autocmd bufleave unite AcpUnlock
    endif
    autocmd FileType unite call s:unite_my_settings()
    function! s:unite_my_settings()"{{{
    " Overwrite settings.
        nmap <buffer> <ESC>      <Plug>(unite_exit)
        imap <buffer> <C-l>      <Plug>(unite_exit)
        nmap <buffer> <C-l>      <Plug>(unite_exit)
        imap <buffer> <C-c>      <Plug>(unite_exit)
        nmap <buffer> <C-c>      <Plug>(unite_exit)
        "imap <buffer> jj      <Plug>(unite_insert_leave)
        imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

                        "Changing the deafult tab:
        "<Tab>       i_<Plug>(unite_choose_action)
        imap <buffer> <TAB> <Plug>(unite_select_next_line)
        imap <buffer> <s-TAB> <Plug>(unite_select_previous_line)
        map <buffer> <TAB> <c-w><c-w>
        map <buffer><c-Cr>   <Plug>(unite_choose_action)
        imap <buffer><c-Cr>  <Plug>(unite_choose_action)
        " Runs "split" action by <C-s>.
        map <silent><buffer><expr> <Cr>    unite#do_action('tabswitch')
        map <silent><buffer><expr> <C-s>   unite#do_action('vsplitswitch')
        map <silent><buffer><expr> <C-h>   unite#do_action('splitswitch')
    endfunction"}}}


" macros!
let @o="zO"
let @p="$zf%"

"dbext https://mutelight.org/dbext-the-last-sql-client-youll-ever-need

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

"let g:airline_theme = 'hybrid' 
let g:airline_theme = 'base16_tomorrow'
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
