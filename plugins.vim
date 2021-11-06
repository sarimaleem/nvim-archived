call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'haya14busa/incsearch.vim'
Plug 'kshenoy/vim-signature'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/vim-easy-align'
Plug 'vhdirk/vim-cmake'
Plug 'tpope/vim-unimpaired'

" harpoon stuff
Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
Plug 'ThePrimeagen/harpoon'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" lsp/autocomplete/snippets stuff
Plug 'lervag/vimtex'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'
Plug 'hrsh7th/nvim-compe'

" colorschemes
Plug 'Th3Whit3Wolf/space-nvim'
Plug 'rafamadriz/neon'
Plug 'tomasiser/vim-code-dark'
Plug 'doums/darcula'
Plug 'sonph/onehalf', {'rtp': 'vim'}
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'junegunn/seoul256.vim'
Plug 'dracula/vim'
Plug 'sainnhe/everforest'
Plug 'sainnhe/gruvbox-material'
call plug#end()
