" there's a bunch of autocomplete options, namely using keystrokes
" and preview-windows to autocomplete. how would that play with github?
" i guess i could just have one set to on at any given time. idk
 " assuming you're using vim-plug: https://github.com/junegunn/vim-plug
call minpac#add('ncm2/ncm2' )
call minpac#add('roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' })

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
call minpac#add('ncm2/ncm2-bufword')
call minpac#add('ncm2/ncm2-path')
set shortmess+=c
" call minpac#add('autozimu/LanguageClient-neovim', {'branch': 'next', 'do': '!bash install.sh'})

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"     \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"     \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"     \ 'python': ['pylsp'],
"     \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
"     \ }

" let g:LanguageClient_loggingLevel = 'INFO'
" let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
" let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')
"
call minpac#add('neovim/nvim-lspconfig')
lua require('completion')
" todo: figure out how to set the github lspclient (https://github.com/github/copilot.vim/blob/6c5abda66350773ae2f8fade2e931b3beb51843f/lua/_copilot.lua#L14) to autostart
" lua copilot.lsp_start_client{}
