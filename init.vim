let mapleader=" "

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
echo "Downloading junegunn/vim-plug to manage plugins..."
silent !mkdir -p ~/.config/nvim/autoload/
silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', { 'branch' : 'release' }
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdtree'
Plug 'lilydjwg/colorizer'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
Plug 'sonph/onehalf', {'rtp': 'vim'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'doums/darcula'
Plug 'tomasiser/vim-code-dark'
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

" comments
filetype plugin indent on
filetype plugin on 
autocmd FileType c,java inoreabbrev <buffer> /** /**<CR>/<Up>

" auto-pairs
let g:AutoPairsFlyMode = 1
au FileType tex let b:AutoPairs = AutoPairsDefine({'$' : '$'})

" Colorscheme
colorscheme codedark
let g:gruvbox_contrast_dark = "hard"

set bg=dark
set go=a
set mouse=a
set nohlsearch
set clipboard=unnamedplus

" Tabs
set tabstop=4
set expandtab
set shiftwidth=4

" map gd :YcmCompleter GoToDefinition<CR>

" Vim fugitive
map <leader>gs :G<CR>
map <leader>gf :diffget // 2<CR>
map <leader>gj :diffget // 3<CR>


" Coc settings
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <silent><expr> <C-space> coc#refresh()

noremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()
map <leader>gi <Plug>(coc-implementation)
map <leader>gr <Plug>(coc-references)
nmap <silent> gd <Plug>(coc-definiton)
map <leader>gy <Plug>(coc-type-definiton)
map <leader>ca <Plug>(coc-codeaction)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nnoremap <leader>cr :CocRestart<CR>
nnoremap <leader>cl :CocList commands<CR>

" something something documentation?
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
     execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
     call CocActionAsync('doHover')
    else
     execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

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
nnoremap <leader>F :Files<CR>
nnoremap <leader>ta :BTags<CR>
nmap <leader>/ :Rg<CR>
set autochdir
set hlsearch
tnoremap <C-\> <C-\><C-n>
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>


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

"Short cut tab navigation
" Should I even have this? It's kind of pointless now that i use buffers basically
" map <M-h> gT
" map <M-l> gt
" map <M-1> :tabn 1<CR>
" map <M-2> :tabn 2<CR>
" map <M-3> :tabn 3<CR>
" map <M-4> :tabn 4<CR>
" map <M-5> :tabn 5<CR>
" map <M-6> :tabn 6<CR>
" map <M-7> :tabn 7<CR>
" map <M-8> :tabn 8<CR>
" map <M-9> :tabn 9<CR>

" Replace all is aliased to S.
nnoremap <leader>sr :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>cc :w! \| !compiler <c-r>%<CR>

" Update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Update shortcuts
	autocmd BufWritePost bmfiles,bmdirs !shortcuts

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
vnoremap <C-c> "+y

" Goyo
map <leader>gg :Goyo<CR>

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 2

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
" let g:limelight_bop = '^\s'
" let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = 10

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

function! BuildComposer(info)
    if a:info.status != 'unchanged' || a:info.force
        if has('nvim')
            !cargo build --release --locked
        else
            !cargo build --release --locked --no-default-features --features json-rpc
        endif
    endif
endfunction
