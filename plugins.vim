call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'

" lsp/language stuff
Plug 'lervag/vimtex'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'hrsh7th/nvim-compe'

" colorschemes
Plug 'tomasiser/vim-code-dark'
Plug 'doums/darcula'
Plug 'gruvbox-community/gruvbox'
Plug 'sonph/onehalf', {'rtp': 'vim'}

call plug#end()
