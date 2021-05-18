let mapleader=" "

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
echo "Downloading junegunn/vim-plug to manage plugins..."
silent !mkdir -p ~/.config/nvim/autoload/
silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-commentary'
" Plug 'neoclide/coc.nvim', { 'branch' : 'release' }
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
Plug 'sonph/onehalf', {'rtp': 'vim'}
" lsp stuff
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" colorschemes
Plug 'tomasiser/vim-code-dark'
Plug 'doums/darcula'
Plug 'gruvbox-community/gruvbox'

call plug#end()

packadd termdebug

" pdf for latex
" settings for sumatraPDF
let g:vimtex_view_general_viewer = 'SumatraPDF.exe'
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" comments
filetype plugin indent on
filetype plugin on 

" auto-pairs
let g:AutoPairsFlyMode = 1
au FileType tex let b:AutoPairs = AutoPairsDefine({'$' : '$'})

" Colorscheme stuff
let g:gruvbox_contrast_dark = "hard"
colorscheme darcula 
" configure treesitter

" configure lsp
" configure treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF

" configure nvcode-color-schemes
let g:nvcode_termcolors=256

syntax on

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif


set bg=dark
set go=a
set mouse=a
set nohlsearch
set clipboard=unnamedplus

" Tabs
set tabstop=4
set expandtab
set shiftwidth=4


" Vim fugitive
map <leader>gs :G<CR>
map <leader>gf :diffget // 2<CR>
map <leader>gj :diffget // 3<CR>

" Some basics:
nnoremap c "_c
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber
set ignorecase
set smartcase
set hidden
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>fi :Files<CR>
nnoremap <leader>ta :Tags<CR>
nmap <leader>/ :Rg<CR>
" set autochdir
set hlsearch
tnoremap <C-\> <C-\><C-n>
nnoremap <F9> :source %<CR>


" Enable autocompletion:
set wildmode=longest,list,full

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

" Nerd tree
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" search and replace
nnoremap <leader>sr :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>cc :w! \| !compiler <c-r>%<CR>

" Update binds when sxhkdrc is updated.
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Update shortcuts
autocmd BufWritePost bmfiles,bmdirs !shortcuts

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
vnoremap <C-c> "+y

func! WordProcessor()
  " movement changes
  map j gj
  map k gk
  map $ g$
  map 0 g0
  " formatting text
  setlocal formatoptions=1
  setlocal noexpandtab
  setlocal wrap
  setlocal linebreak
  " spelling and thesaurus
  setlocal spell spelllang=en_us
  set thesaurus+=/home/test/.vim/thesaurus/mthesaur.txt
  " complete+=s makes autocompletion search the thesaurus
  set complete+=s
endfu
