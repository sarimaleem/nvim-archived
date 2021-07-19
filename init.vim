let mapleader=" "
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
echo "Downloading junegunn/vim-plug to manage plugins..."
silent !mkdir -p ~/.config/nvim/autoload/
silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

runtime plugins.vim
runtime latex.vim
runtime lsp.vim
runtime autocomplete.vim

packadd termdebug

" Some basics:
filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber
set ignorecase
set smartcase
set hidden
set hlsearch
set splitbelow splitright
set termguicolors
nnoremap <F9> :source $VIMRC<CR>
nnoremap <leader>sr :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
tnoremap <C-\> <C-\><C-n>
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
set timeoutlen=250

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" fzf keybindings
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>fi :Files<CR>
nnoremap <leader>ta :Tags<CR>
nnoremap <leader>co :Commands<CR>
nmap <leader>/ :Rg<CR>

" auto-pairs
let g:AutoPairsFlyMode = 1
au FileType tex let b:AutoPairs = AutoPairsDefine({'$' : '$'}) 

" lightspeed nvim
map s <Plug>Lightspeed_s
map S <Plug>Lightspeed_S

" Colorscheme stuff
let g:gruvbox_material_background = "hard"
let g:everforest_background = "hard"
let g:neon_style="dark"
colorscheme gruvbox-material

set bg=dark
set go=a
set mouse=a
set clipboard=unnamedplus

"incsearch plugin
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Tabs
set tabstop=4
set expandtab
set shiftwidth=4

" Enable autocompletion:
set completeopt=menuone,noselect
set wildmode=longest,list,full

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_us<CR>

" Nerd tree
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
vnoremap <C-c> "+y

lua << EOF
-- vim whick key setup
require("which-key").setup {
    }
EOF

