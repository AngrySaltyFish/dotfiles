
filetype plugin on
syntax on

"This is for tabbing
set expandtab
set shiftwidth=4
set softtabstop=4
set number

"using vim-plug for plugin management https://github.com/junegunn/vim-plug
"this section begins the plugins

call plug#begin('~/.local/share/nvim/plugged')

"This adds code completion
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'


"This is the python server for autocomplete
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif


"This is the clang server for auto complete
if executable('/mnt/externalHD/home/james/Builds/llvm-build/bin/clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

"This adds buffer management
Plug 'ap/vim-buftabline'


"This is for latex
Plug 'lervag/vimtex'

call plug#end()
"end of plugin section

nnoremap <M-k> m`O<esc>``
nnoremap <M-j> m`o<esc>``

inoremap <M-j> <esc>m`o<esc>``a
inoremap <M-k> <esc>m`O<esc>``a

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

imap <c-space> <Plug>(asyncomplete_force_refresh)

"This is for latex settings
let g:vimtex_complete_enabled = 1
let g:vimtex_complete_close_braces = 1

