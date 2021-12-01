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

" fzf
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>fi :Files<CR>
nnoremap <leader>ta :Tags<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>/ :Rg<CR>

" Shortcutting split navigation, saving a keypress: map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-h> <C-w>h
map <C-k> <C-w>k
map <C-l> <C-w>l

" sneak.vim
let g:sneak#label = 1
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S

" auto-pairs
let g:AutoPairsFlyMode = 1
au FileType tex let b:AutoPairs = AutoPairsDefine({'$' : '$'}) 

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

" Terminal commands
" ueoa is first through fourth finger left hand home row.
" This just means I can crush, with opposite hand, the 4 terminal positions
"
" These functions are stored in harpoon.  A plugin that I am developing
nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>tc :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <leader>1  :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>2  :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>3  :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>4  :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>tu :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <leader>te :lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <leader>cu :lua require("harpoon.term").sendCommand(1, 1)<CR>
nnoremap <leader>ce :lua require("harpoon.term").sendCommand(1, 2)<CR>
