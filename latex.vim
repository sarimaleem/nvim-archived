" pdf for latex
"
" settings for sumatraPDF
" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>cc :w! \| !compiler <c-r>%<CR>
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
