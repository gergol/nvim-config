"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc
" Mostly taken from this tutorial : https://youtu.be/wzrZPcwh-bE

set encoding=utf-8
"set guifont=Hack\ 13
set number relativenumber
syntax on
set noswapfile
set scrolloff=7
"set undofile

set backspace=indent,eol,start
" Give more space for displaying messages.
set cmdheight=1
" set hidden is necessary for lsp go to definition to work
" with unsaved buffers
set hidden

" ========== LINE BREAKS, WRAP ETC. ============

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
"set columns=120
set wrap
set linebreak

" ======= FOLDING =======
" Vim define folds automatically by indent level, but would also like to create folds manually
" See: https://vim.fandom.com/wiki/Folding#Manual_folding
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
" Or set it fixed here
"set foldmethod=indent
set foldlevel=0
set foldnestmax=2
" start with opened folds
set nofoldenable


set fileformat=unix

set termguicolors
set cursorline

set path+=**
" Leave the leader on it's default (\).
" It will be remapped in normal mode only to <space>
"let  mapleader = ' '
" Display invisible characters
"set list
"set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»

" Disable line numbers and sign column for terminal
autocmd TermOpen * setlocal nonumber norelativenumber scl="no"
" Mimic Vim8 Terminal escape
:tnoremap <C-w> <C-\><C-n><CR><C-l><C-w><Cr>

" Set ignore whitesace for diff
set diffopt+=iwhite

if (has('win64'))
  let g:python3_host_prog = expand("$HOME/.virtualenvs/neovim/Scripts/python.exe")
else
  let g:python3_host_prog = expand("$HOME/.virtualenvs/neovim/bin/python")
endif
" Location of the config folder where this file here is in.
let g:nvim_config_root = stdpath('config')

" Load Plugins
" helper functions to allow sharing path between win and linux
function! SourceLocal(relativePath)
  let fullPath = g:nvim_config_root . '/'. a:relativePath
  exec 'source ' . fullPath
endfunction

function! LuafileLocal(relativePath)
  let fullPath = g:nvim_config_root . '/'. a:relativePath
  exec 'luafile ' . fullPath
endfunction


call SourceLocal('vim-plug/plugins.vim')

""luafile $HOME/.config/nvim/lua/lsp/vim-web-devicons.lua
"" Configurations
"source $HOME/.config/nvim/plug-config/mkdx.vim
"source $HOME/.config/nvim/plug-config/lsp-config.vim
call LuafileLocal('lua/lsp-config.lua')
call LuafileLocal('lua/compe-config.lua')
call LuafileLocal('lua/nvim-treesitter-conf.lua')
call LuafileLocal('lua/lsp/lspsaga.lua')
"n
"" NB: the following files are disabled as the setup 
"" of the lsp servers is now done in the lsp-config.vim file.
"" Otherwise, these here would override the definitions therein.
" call LuafileLocal('lua/lsp/clangd-ls.lua')
" call LuafileLocal('lua/lsp/cmake-ls.lua')
" call LuafileLocal('lua/lsp/json-ls.lua')
" call LuafileLocal('lua/lsp/html-ls.lua')
" call LuafileLocal('lua/lsp/python-ls.lua')
" call LuafileLocal('lua/lsp/vim-ls.lua')

"" Setup ALL key bindings for the whole system
call SourceLocal('keys.vim')
call SourceLocal('plug-config/nvim-autopairs.vim')

call SourceLocal('plug-config/cmake4vim.vim')

luafile $HOME/.config/nvim/plug-config/harpoon.lua

"colorscheme onedark
"let g:airline_theme='onedark'

"colorscheme gruvbox
"let g:airline_theme='gruvbox'

colorscheme sonokai
let g:airline_theme='sonokai'

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

" call SourceLocal('plug-config/coc.vim')

" Vimspector debugging plugin
call SourceLocal('plug-config/vimspector.vim')


call SourceLocal('plug-config/telescope.vim')
"
" Ultisnips
"call SourceLocal('plug-config/ultisnips.vim')

call SourceLocal('plug-config/markdown-preview-config.vim')


