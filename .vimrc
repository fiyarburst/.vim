" Notes
"
" Plugins are managed with minpac. to install plugins or update, type
" :call minpac#update(). This means minpac needs to be bootstrapped, which we do with
" vim 8's native :packadd command.
"
" check out tpope/vim-sensible which contains a bunch of defaults. Notably, 
" vim-sensible contains incsearch and a mapping to clear hls with <C-L>.
"
" I've removed all the formatters and syntastic stuff from my original config, 
" which included formatters for ['black', 'yapf', 'autopep8'] and used the
" textwidth i set (120 here) for linelength checks.
"
" I had <leader>l/h/ww for :bnext/bprevious/bclose respectively, does a plugin I've installed do this sort of thing for me already?

" Defaults. Includes drawing, ; for : commands, my comma leader, indenting editing and textwidth settings.
set ttyfast lazyredraw showcmd number relativenumber
set shiftwidth=4 tabstop=4 expandtab
let mapleader = ','
noremap ; :

set directory=~/.vim/swap/,/tmp/vim/swap/
set maxmempattern=8000

set smartcase
set textwidth=120

" Colors
colorscheme peachpuff

" Airline
let g:airline_theme = 'behelit'
" let g:airline_theme = 'biogoo'
" atomic is minimal
" also deus, 
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0

""" Plugins
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-sensible')
" vim-sensible also comes with matchit.vim, which adds multi-level cycling (eg if/else/endif)
" and backwards cycling. Can pair nicely with zf% for folding
call minpac#add('tpope/vim-unimpaired')
call minpac#add('mbbill/undotree')
call minpac#add('tpope/vim-scriptease', {'type': 'opt'})
call minpac#add('preservim/tagbar')
call minpac#add('junegunn/fzf', {'do': {-> system('fzf#install()')}})
call minpac#add('junegunn/fzf.vim')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('github/copilot.vim')

"Bclose is required for ranger.vim
call minpac#add('francoiscabrol/ranger.vim')
call minpac#add('rbgrouleff/bclose.vim')
nnoremap <C-p> :<C-u>FZF<CR>

" Line manipulation
noremap <C-j> ddp
noremap <C-k> ddkkp

" Indent Guides
call minpac#add('nathanaelkane/vim-indent-guides')
map <leader>ig <Plug>IndentGuidesToggle
let g:indent_guides_start_level = 1
let g:indent_guides_auto_colors = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1


" Tagbar
noremap <leader>t :TagbarToggle<CR>

" Ranger
let g:ranger_replace_netrw = 1

" Dbext
" Not currently used but I have this snippet to open Notes.app in vim
" let g:dbext_default_profile_Notes = 'type=SQLITE:SQLITE_bin=/usr/local/bin/sqlite3:dbname=/Users/ankeet.presswala/Library/Group\ Containers/group.com.apple.notes/NoteStore.sqlite'

" vim:set ft=vim et sw=2:
