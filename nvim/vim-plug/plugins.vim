
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')
" Better Syntax Support
Plug 'sheerun/vim-polyglot'
Plug 'tmhedberg/SimpylFold'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 

" Color schemes
Plug 'sainnhe/sonokai'
"Plug 'morhetz/gruvbox'
"Plug 'joshdick/onedark.vim'

Plug 'tpope/vim-surround'

"Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
let NERDTreeShowHidden=1

Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'hrsh7th/vim-vsnip' | Plug 'hrsh7th/vim-vsnip-integ' | Plug 'rafamadriz/friendly-snippets'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'tzachar/compe-tabnine', { 'do': './install.sh' }
Plug 'glepnir/lspsaga.nvim'
Plug 'ray-x/lsp_signature.nvim'
"Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
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
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-media-files.nvim'

Plug 'mhinz/vim-startify'

Plug 'tpope/vim-fugitive'
" indentation selection support
Plug 'michaeljsmith/vim-indent-object'
Plug 'vimjas/vim-python-pep8-indent'

" Parenthesis etc. matching
Plug 'windwp/nvim-autopairs'
"Plug 'andymass/vim-matchup'
"
" Markdown preview
" NOTE: this next line requires yarn to be installed. If this makes trouple, just comment it out it and live without markdown preview.
" Unfortunately the prebuilt binaries seem not to work on my main system.
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
"Plug 'kyazdani42/nvim-web-devicons'

" C++
Plug 'ilyachur/cmake4vim'

" According to doc this plugin should be loaded at the very end
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
" Initialize plugin system
call plug#end()
