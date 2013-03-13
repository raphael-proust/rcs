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

Bundle 'tpope/vim-repeat.git'
Bundle 'edsono/vim-matchit.git'

Bundle 'rc.vim'

Bundle 'raphael-proust/ocaml_lwt.vim.git'
autocmd FileType ocaml_lwt set foldlevel=9
autocmd FileType ocaml_lwt set equalprg=ocp-indent

Bundle 'raphael-proust/pdc.vim.git'

Bundle 'vim-scripts/SuperTab.git'

Bundle 'vim-scripts/surround.vim.git'
"French typographic rules impose non-breakable space
let g:surround_171="« \r »"
let g:surround_8249="‹ \r ›"

Bundle 'sjl/gundo.vim.git'
nnoremap <F3> :GundoToggle<CR>

Bundle 'tpope/vim-fugitive.git'

"Vundle post-initialisation phase
filetype plugin indent on
syntax off
Bundle 'raphael-proust/molokai.git'
colorscheme molokai

"updatetime influences CursorHold events
set updatetime=2000

" Change leader to , (comma)
"TODO: different leaders
let maplocalleader=","
let mapleader=","

"latex suite (prefer pandoc)
set grepprg=grep\ -nH\ $*
let g:tex_flavor= "latex"

"save with confirmation
set confirm

"Better diffs (with switchable whitespace ignoring)
set diffopt=filler,vertical,context:5
nnoremap <F4> :if &diffopt =~ "iwhite" \| set diffopt-=iwhite \| else \| set diffopt+=iwhite \| endif<CR>
command Diffall windo diffthis
command Diffnone windo diffoff

"Tabs (the absence of), indent and the such
set nosmarttab
set noexpandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4
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
imap <F1> <Nop>
set magic
set gdefault

"matching bras and kets
set showmatch

"Status and all
set wildmode=longest,list
set laststatus=2
set showcmd
set ruler
set novisualbell
set noerrorbells
set shortmess+=filmnrxtI

"Lines
set textwidth=78
noremap Q gq
set nojoinspaces
set wrap

"More history
set history=500
set undolevels=500
set undoreload=10000
set undofile
autocmd BufRead,BufNewFile /tmp/* set noundofile
if !isdirectory(expand("~/.vim/undofiles"))
  call mkdir(expand("~/.vim/undofiles"))
endif
set undodir=$HOME/.vim/undofiles

"Window and term
set title
set termencoding=utf-8
set encoding=utf-8

"Beautiful additional chars
set list
set listchars=tab:▷\ ,trail:◇,extends:⌟,precedes:⌜,nbsp:—
set showbreak=›\ 
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

"Buffers and window handling
set switchbuf=usetab,newtab
map <C-w>! :vertical resize 78<CR>
map g0 :tabfirst<CR>
map g$ :tablast<CR>

"in command mode use <C-j/k> for history and <C-h/l> for moving
cmap <C-h> <Left>
cmap <C-j> <Down>
cmap <C-k> <Up>
cmap <C-l> <Right>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

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

" Text Sanitization
function! StripWhitespace () range
  let l:cursor = getpos(".")
  let l:query = getreg('/')
  let regmode = getregtype('/')
  execute a:firstline . ',' . a:lastline . 's/\s\+$//e'
  call setpos('.', l:cursor)
  call setreg('/', l:query, l:regmode)
endfunction
command -range=% Trailing :<line1>,<line2>call StripWhitespace()
command -range=% SubsTabs2 :<line1>,<line2>s/\t/  /e
command -range=% SubsTabs4 :<line1>,<line2>s/\t/    /e
command -range=% SubsTabs8 :<line1>,<line2>s/\t/        /e
command -nargs=1 Tabs :set sts=<args> sw=<args> ts=<args>
command -range=% Nbsp :<line1>,<line2>s/\%d160//e
command -range=% Textsc :<line1>,<line2>s/\(\<\u\+\>\)/\\textsc{\L\1\E}/ce

" Spelling
command Spellfr :setlocal spell | :setlocal spelllang=fr
command Spellus :setlocal spell | :setlocal spelllang=en_us
command Spellgb :setlocal spell | :setlocal spelllang=en_gb
command Spellno :setlocal nospell

" filetype specific options
autocmd FileType make set noexpandtab
au BufEnter,BufNewFile,BufRead * call FileTypeDetect()
fun! FileTypeDetect()
  let l = getline(nextnonblank(1))
  if l =~ '#!/bin/dash'
    set filetype=sh
  endif
endfun

"unf.ck terminal title
let &titleold=getcwd()

"On the fly sudo
command Sudow :w !sudo tee %

"Status line with a little more information
function SpellLang()
    if &spell | return ',' . &spelllang | else | return '' | endif
endfunction
set statusline=%<%f%q\ \ [%Y%M%R%W%{SpellLang()}]%=%-11(%l,%c%V%)\ \ %P
