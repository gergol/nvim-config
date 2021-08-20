"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc
" Mostly taken from this tutorial : https://youtu.be/wzrZPcwh-bE
set encoding=utf-8
"set guifont=Hack\ 13
set number relativenumber
syntax enable
set noswapfile
set scrolloff=7
set backspace=indent,eol,start

"set undofile
" set hidden is necessary for lsp go to definition to work
" with unsaved buffers
set hidden

set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
"set columns=120
set wrap
set linebreak



set fileformat=unix

set termguicolors
set cursorline
let  mapleader = ' '
" Display invisible characters
"set list
"set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»

" Disable line numbers and sign column for terminal
autocmd TermOpen * setlocal nonumber norelativenumber scl="no"
" Mimic Vim8 Terminal escape
:tnoremap <C-w> <C-\><C-n><CR><C-l><C-w><Cr>

" Set ignore whitesace for diff
set diffopt+=iwhite

" Load Plugins
source $HOME/.config/nvim/vim-plug/plugins.vim

" Configurations
"source $HOME/.config/nvim/plug-config/mkdx.vim
source $HOME/.config/nvim/plug-config/lsp-config.vim
luafile $HOME/.config/nvim/lua/lsp/lsp-config.lua

"luafile $HOME/.config/nvim/lua/lsp/lspsaga.lua
"n
"" NB: the following files are disabled as the setup 
"" of the lsp servers is now done in the lsp-config.vim file.
"" Otherwise, these here would override the definitions therein.
"luafile $HOME/.config/nvim/lua/lsp/clangd-ls.lua
"luafile $HOME/.config/nvim/lua/lsp/cmake-ls.lua
"luafile $HOME/.config/nvim/lua/lsp/json-ls.lua
"luafile $HOME/.config/nvim/lua/lsp/html-ls.lua
"luafile $HOME/.config/nvim/lua/lsp/python-ls.lua
"luafile $HOME/.config/nvim/lua/lsp/vim-ls.lua

"" Setup ALL key bindings for the whole system
source $HOME/.config/nvim/keys.vim
source $HOME/.config/nvim/plug-config/nvim-autopairs.vim

colorscheme onedark
let g:airline_theme='onedark'

"colorscheme gruvbox
"let g:airline_theme='gruvbox'

highlight! link LspDiagnosticsUnderlineError CocErrorHighlight
highlight! link LspDiagnosticsUnderlineHint CocHintHighlight
highlight! link LspDiagnosticsUnderlineInfo CocInfoHighlight
highlight! link LspDiagnosticsUnderlineWarning CocWarningHighlight
hi LspDiagnosticsVirtualTextError guifg=red gui=bold,italic,underline
hi LspDiagnosticsVirtualTextWarning guifg=orange gui=bold,italic,underline
hi LspDiagnosticsVirtualTextInformation guifg=yellow gui=bold,italic,underline
hi LspDiagnosticsVirtualTextHint guifg=green gui=bold,italic,underline 

" NERDTree
let NERDTreeQuitOnOpen=1

" Tabs
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'

" source $HOME/.config/nvim/plug-config/coc.vim

" Vimspector debugging plugin
source $HOME/.config/nvim/plug-config/vimspector.vim

let g:python3_host_prog = '/home/gerald/.virtualenvs/neovim/bin/python'

"source $HOME/.config/nvim/plug-config/telescope.vim
"
" Ultisnips
"source $HOME/.config/nvim/plug-config/ultisnips.vim


set foldmethod=indent
set foldlevel=20
set foldclose=all
