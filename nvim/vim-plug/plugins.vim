
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')
" Better Syntax Support
Plug 'sheerun/vim-polyglot'
Plug 'tmhedberg/SimpylFold'

"Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
"Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Plug 'hrsh7th/vim-vsnip' | Plug 'hrsh7th/vim-vsnip-integ' | Plug 'rafamadriz/friendly-snippets'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'
"Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
"Plug 'RishabhRD/popfix'
"Plug 'RishabhRD/nvim-lsputils'
" Debugger Plugins
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

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

" Parenthesis etc. matching
Plug 'windwp/nvim-autopairs'
"Plug 'andymass/vim-matchup'
" Markdown support
"Plug 'SidOfc/mkdx'

" Markdown preview
" Need to call the following after PlugInstall: :call mkdp#util#install()
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" According to doc this plugin should be loaded at the very end
" Plug 'ryanoasis/vim-devicons'
" Initialize plugin system
call plug#end()
