
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')
" Prevent opening buffers in small windows like nerdetree
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
Plug 'stevearc/stickybuf.nvim'

Plug 'tpope/vim-fugitive'
" Better Syntax Support
Plug 'sheerun/vim-polyglot'
"Plug 'tmhedberg/SimpylFold'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 

" Color schemes
Plug 'sainnhe/sonokai'
"Plug 'morhetz/gruvbox'
"Plug 'joshdick/onedark.vim'
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'martinsione/darkplus.nvim'
Plug 'Mofiqul/vscode.nvim'

Plug 'tpope/vim-surround'

"Plug 'jiangmiao/auto-pairs'
" Case sensitive search/replace and more...
Plug 'tpope/vim-abolish'

Plug 'preservim/nerdcommenter'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }


" Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
"Plug 'quangnguyen30192/cmp-nvim-ultisnips'n

Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/lsp-status.nvim'


Plug 'tami5/lspsaga.nvim'
Plug 'github/copilot.vim'
"Plug 'glepnir/lspsaga.nvim'
"Plug 'ray-x/lsp_signature.nvim'
"Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
"Plug 'ray-x/navigator.lua'
"Plug 'folke/trouble.nvim'

"Plug 'hrsh7th/cmp-vsnip'
"Plug 'hrsh7th/vim-vsnip' | Plug 'hrsh7th/vim-vsnip-integ' | Plug 'rafamadriz/friendly-snippets'
"Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'hrsh7th/cmp-buffer'
"Plug 'hrsh7th/cmp-path'
"Plug 'hrsh7th/cmp-cmdline'
"Plug 'hrsh7th/nvim-cmp'

" main one
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
" Need to **configure separately**

Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

" Plug 'hrsh7th/nvim-compe'
"Plug 'tzachar/compe-tabnine', { 'do': './install.sh' }
"Plug 'RishabhRD/popfix'
"Plug 'RishabhRD/nvim-lsputils'
" Debugger Plugins
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'voldikss/vim-floaterm'


Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"Plug 'nvim-telescope/telescope-fzy-native.nvim'
if(has("Win64"))
    " fzf native seems to be complicated to install on windows, so let's skip
    " it for now.
else
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
endif
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'ThePrimeagen/harpoon'

" indentation selection support
Plug 'michaeljsmith/vim-indent-object'
Plug 'vimjas/vim-python-pep8-indent'

" Parenthesis etc. matching
Plug 'windwp/nvim-autopairs'
" show vertivcal lines to highlight indented blocks
Plug 'lukas-reineke/indent-blankline.nvim'

"Plug 'andymass/vim-matchup'
"
" Markdown preview
" NOTE: this next line requires yarn to be installed. If this makes trouple, just comment it out it and live without markdown preview.
" Unfortunately the prebuilt binaries seem not to work on my main system.
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" Symbols windows
Plug 'stevearc/aerial.nvim'

" C++
Plug 'ilyachur/cmake4vim'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'p00f/godbolt.nvim'

" According to doc this plugin should be loaded at the very end
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
" Initialize plugin system
call plug#end()
