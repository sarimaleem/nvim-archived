let mapleader=" "

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
echo "Downloading junegunn/vim-plug to manage plugins..."
silent !mkdir -p ~/.config/nvim/autoload/
silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

runtime plugins.vim
runtime latex.vim
runtime lsp.vim

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
nnoremap <F9> :source $VIMRC<CR>
nnoremap <leader>sr :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
tnoremap <C-\> <C-\><C-n>

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" easymotion
map <Leader>se <Plug>(easymotion-s)

" fzf keybindings
nnorema <leader>b :Buffers<CR>
nnoremap <leader>fi :Files<CR>
nnoremap <leader>t :Tags<CR>
nmap <leader>/ :Rg<CR>

" auto-pairs
let g:AutoPairsFlyMode = 1
au FileType tex let b:AutoPairs = AutoPairsDefine({'$' : '$'}) 

" Colorscheme stuff
let g:gruvbox_contrast_dark = "hard"
colorscheme codedark

set bg=dark
set go=a
set mouse=a
set clipboard=unnamedplus

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
