set nocompatible

"Vundle initialisation
if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
endif
filetype off
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"Loading the bundles

Bundle 'tsaleh/vim-align.git'
autocmd BufRead,BufNewFile * AlignCtrl rl:

Bundle 'edsono/vim-matchit.git'

Bundle 'raphael-proust/ocaml_lwt.vim.git'
Bundle 'ocamlMultiAnnot'
autocmd FileType ocaml_lwt set foldlevel=9

Bundle 'raphael-proust/pdc.vim.git'

Bundle 'vim-scripts/SuperTab.git'

Bundle 'rson/vim-conque.git'
let g:ConqueTerm_CWInsert = 1
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_Color = 0

Bundle 'vim-scripts/surround.vim.git'
"French typographic rules impose non-breakable space
let g:surround_171="« \r »"
let g:surround_8249="‹ \r ›"

Bundle 'vim-scripts/ZoomWin.git'

Bundle 'sjl/gundo.vim.git'
nnoremap <F3> :GundoToggle<CR>

Bundle 'tpope/vim-fugitive.git'

Bundle 'sjl/splice.vim.git'
let g:splice_initial_mode = "grid"
let g:splice_initial_layout_grid = 1
let g:splice_initial_diff_grid = 1
let g:splice_initial_scrollbind_grid = 1

Bundle 'raphael-proust/molokai.git'
colorscheme molokai

Bundle 'coq-syntax'
autocmd BufRead,BufNewFile *.v   set filetype=coq

Bundle 'taglist'

Bundle 'scrooloose/nerdtree'
nnoremap <F5> :NERDTreeToggle<CR>

Bundle 'ShowMarks7'
let g:showmarks_enable=0
let g:showmarks_textlower="'\t"
let g:showmarks_textupper="'\t"
let g:showmarks_textother="'\t"
let g:showmarks_ignore_type="hqmp"


Bundle 'wlangstroth/vim-racket.git'


"Vundle post-initialisation phase
filetype plugin indent on
syntax on

"updatetime influences CursorHold events
set updatetime=2000

" Change leader to , (comma)
"TODO: different leaders
let maplocalleader=","
let mapleader=","

"latex suite (prefer pandoc)
set grepprg=grep\ -nH\ $*
let g:tex_flavor= "latex"

"Better diffs (with switchable whitespace ignoring)
set diffopt=filler,vertical,context:5
nnoremap <F4> :if &diffopt =~ "iwhite" \| set diffopt-=iwhite \| else \| set diffopt+=iwhite \| endif<CR>

"Tabs (the absence of), indent and the such
set smarttab
set expandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set copyindent
set noshiftround

"Moving around
set backspace=indent,start
set virtualedit=block
set scrolloff=5
set sidescrolloff=5
set nostartofline

"Splits
set splitright
set splitbelow

"Search and substitute
set hlsearch
map <F1> :set hls!<CR>
imap <F1> :set hls!<CR>
set magic
set gdefault

"matching bras and kets
set showmatch

"Status and all
set wildmode=longest,list
set laststatus=2
set showcmd
set ruler
set visualbell
set shortmess+=filmnrxtI

"Lines
set textwidth=80
noremap Q gq
set nojoinspaces
set wrap

"More history
set history=500
set undolevels=500
set undoreload=10000
set undofile
set undodir=$HOME/.vim/undofiles

"Window and term
set title
set termencoding=utf-8
set encoding=utf-8

"Beautiful additional chars
set list
set listchars=tab:▶┉,trail:◇,extends:▷,precedes:◁,nbsp:—
set showbreak=››
set fillchars-=vert:\|
set fillchars+=vert:\ 
set fillchars-=fold:-
set fillchars+=fold:—
set fillchars-=diff:-
set fillchars+=diff:—

"Copy-Pasta
set pastetoggle=<F2>
nmap <leader>y "+y
nmap <leader>Y "+yy
nmap <leader>p "+p
nmap <leader>P "+P
nmap Y y$
nmap <silent> <leader>d "_d
vmap <silent> <leader>d "_d

"Buffers and window handling
set switchbuf=usetab
map <C-w>! :vertical resize 80<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map g0 :tabfirst<CR>
map g$ :tablast<CR>

" Highlights long lines
set colorcolumn=+1

" Ignore irrelevant suffixes for filename completion
set wildignore+=*.a,*.bak,*~,*.swp,*.o,*.info,*.out,*.exe,*.pyc,*.class
set wildignore+=*.dvi,*.pdf,*.bbl,*.aux,*.bbl,*.blg
set wildignore+=*.cmi,*.cmo,*.cma,*.cmx,*.cmxa,*.omc,*.annot

" various maps
nnoremap ' `
nnoremap ` '
map <leader>cd :cd %:p:h<CR>
map K :.-,.join<CR>

" Alignment
nmap <leader>al :left<CR>
nmap <leader>ar :right<CR>
nmap <leader>ac :center<CR>
vmap <leader>al :left<CR>
vmap <leader>ar :right<CR>
vmap <leader>ac :center<CR>

" Text Sanitization
function! StripWhitespace () range
  let l:cursor = getpos(".")
  let l:query = getreg('/')
  let regmode = getregtype('/')
  execute a:firstline . ',' . a:lastline . 's/\s\+$//e'
  call setpos('.', l:cursor)
  call setreg('/', l:query, l:regmode)
endfunction
command -range=% Trailing :<line1>,<line2>call StripWhitespace()<CR>
command -range=% SubsTabs2 :<line1>,<line2>s/\t/  /e
command -range=% SubsTabs4 :<line1>,<line2>s/\t/    /e
command -range=% SubsTabs8 :<line1>,<line2>s/\t/        /e
command -nargs=1 Tabs :set sts=<args> sw=<args> ts=<args>
command -range=% Nbsp :<line1>,<line2>s/\%d160//e
command -range=% Textsc :<line1>,<line2>s/\(\<\u\+\>\)/\\textsc{\L\1\E}/ce

" Spelling
command Spellfr :setlocal spell | :setlocal spelllang=fr_fr
command Spellus :setlocal spell | :setlocal spelllang=en_us
command Spellgb :setlocal spell | :setlocal spelllang=en_gb

command -range=% Vpaste :exec "<line1>,<line2>w !vpaste ft=".&ft

" filetype specific options
autocmd FileType make set noexpandtab
"mlton files
autocmd BufRead,BufNewFile *.fun   set filetype=sml
autocmd BufRead,BufNewFile *.sig   set filetype=sml

"llvm bitcode files
autocmd BufRead,BufNewFile *.ll    set filetype=llvm

"for small screens (less than (2×80+1), greater than (80+1+1))
"au BufEnter * vert res 80

"On the fly sudo
command Sudow :w !sudo tee %

"Status line with a little more information
set statusline=%<%f\ \ [%Y%M%R%W]%=%-11(%l,%c%V%)\ \ %P
