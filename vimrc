set nocompatible

"Vundle initialisation
filetype off
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"Loading the bundles
Bundle 'tsaleh/vim-align.git'
Bundle 'edsono/vim-matchit.git'
Bundle 'raphael-proust/ocaml_lwt.vim.git'
Bundle 'raphael-proust/pdc.vim.git'
Bundle 'vim-scripts/SuperTab.git'
Bundle 'rson/vim-conque.git'
Bundle 'vim-scripts/surround.vim.git'
Bundle 'vim-scripts/ZoomWin.git'
Bundle 'sjl/gundo.vim.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'sjl/threesome.vim.git'
Bundle 'raphael-proust/molokai.git'
Bundle 'coq-syntax'
Bundle 'ocamlMultiAnnot'
Bundle 'taglist'
Bundle 'scrooloose/nerdtree'

"Vundle post-initialisation phase
filetype plugin indent on
syntax on


" Change leader to , (comma)
"TODO? different leaders?
let maplocalleader=","
let mapleader=","

"latex suite (prefer pandoc)
set grepprg=grep\ -nH\ $*
let g:tex_flavor= "latex"

"conq plugin
let g:ConqueTerm_CWInsert = 1
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_Color = 0

"backups plugin
let g:backup_purge=32

"gundo plugin
nnoremap <F3> :GundoToggle<CR>

"threesome plugin
let g:threesome_initial_mode = "grid"
let g:threesome_initial_layout_grid = 1
let g:threesome_initial_diff_grid = 1
let g:threesome_initial_scrollbind_grid = 1

"Better diffs (with switchable whitespace ignoring)
set diffopt=filler,vertical,context:5
nnoremap <F4> :if &diffopt =~ "iwhite" \| set diffopt-=iwhite \| else \| set diffopt+=iwhite \| endif<CR>

"Tabs, indent and the such
set noexpandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set copyindent
set preserveindent


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
set background=dark

"colorscheme
colorscheme molokai

"Beautiful additional chars
set list
set listchars=tab:›·,trail:·,extends:›,precedes:‹,nbsp:—
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

"NERDTree invocation
nnoremap <F5> :NERDTreeToggle<CR>

" Highlights long lines
set colorcolumn=+1

" Ignore irrelevant suffixes for filename completion
set wildignore+=*.a,*.bak,*~,*.swp,*.o,*.info,*.out,*.exe,*.pyc,*.class
set wildignore+=*.dvi,*.pdf,*.bbl,*.aux,*.bbl,*.blg
set wildignore+=*.cmi,*.cmo,*.cma,*.cmx,*.cmxa,*.omc,*.annot

" maps
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
command Trailing :%s/\s\+$//e
command SubsTabs4 :%s/\t/    /e
command SubsTabs8 :%s/\t/        /e
command -nargs=1 Tabs :set sts=<args> sw=<args> ts=<args>
command Nbsp :%s/\%d160//e
command Textsc :%s/\(\<\u\+\>\)/\\textsc{\L\1\E}/c

" Spelling
command Spellfr :setlocal spell | :setlocal spelllang=fr_fr
command Spellus :setlocal spell | :setlocal spelllang=en_us
command Spellgb :setlocal spell | :setlocal spelllang=en_gb

command -range=% Vpaste :exec "<line1>,<line2>w !vpaste ft=".&ft

"Surround additional characters
let g:surround_171="« \r »"
let g:surround_8249="‹ \r ›"
"French typographic rules impose non-breakable space

" filetype specific options
autocmd FileType make set noexpandtab
autocmd FileType ocaml_lwt set foldlevel=9
"coq files (I don't use verilog anyway)
autocmd BufRead,BufNewFile *.v   set filetype=coq
"mlton files
autocmd BufRead,BufNewFile *.fun   set filetype=sml

"for small screens (less than (2×80+1), greater than (80+1+1))
"au BufEnter * vert res 80

"On the fly sudo
command Sudow :w !sudo tee %

"Status line with a little more information
set statusline=%<%f\ \ [%Y%M%R%W]%=%-11(%l,%c%V%)\ \ %P

" setting ; as : (obsolete because of xmodmap and betterus map)


