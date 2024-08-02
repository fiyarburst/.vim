" Vim python config
" Add python plugins
set textwidth=120

let g:python3_host_prog = '~/.vim/vimpy/bin/python3'

" Autoformat
call minpac#add('vim-autoformat/vim-autoformat')
let g:formatters_python = ['black', 'yapf', 'autopep8']
let g:formatdef_black = '"black -q ".(&textwidth ? "-l".&textwidth : "")." -"'


