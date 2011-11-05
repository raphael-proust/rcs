"I want vim, not vi
set nocompatible

" Pathogen
filetype off
call pathogen#infect()
syntax on
filetype plugin indent on

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
set smarttab
set expandtab
set shiftwidth=2
set tabstop=4
set autoindent
set copyindent
set shiftround

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
set t_Co=256
set bg=dark

"colorscheme
colorscheme molokai

"Beautiful additional chars
set list
set listchars=tab:›·,trail:·,extends:›,precedes:›,nbsp:—
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
nnoremap <F5> :ls<CR>
map g0 :tabfirst<CR>
map g$ :tablast<CR>

" Highlights long lines
set colorcolumn=+1

" Ignore irrelevant suffixes for filename completion
set wildignore+=*.a,*.bak,*~,*.swp,*.o,*.info,*.dvi,*.pdf,*.out,*.cmi,*.cmo,*.cma,*.cmx,*.cmxa,*.omc,*.annot,*.exe,*.pyc,*.class

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
command Tabs4 :%s/\t/    /e
command Tabs8 :%s/\t/        /e
command Nbsp :%s/\%d160//e

" Spelling
command Spellfr :setlocal spell | :setlocal spelllang=fr_fr
command Spellus :setlocal spell | :setlocal spelllang=en_us
command Spellgb :setlocal spell | :setlocal spelllang=en_gb

" filetype specific options
au FileType make set noexpandtab
au FileType latex set formatoptions+=a
au BufRead *.pdc set ft=pdc
au FileType pdc set formatoptions+=n
au FileType ocaml_lwt :set foldlevel=9

"for small screens (less than (2×80+1))
"au BufEnter * vert res 80

"On the fly sudo
command Sudow :w !sudo tee %

"Status line with a little more information
set statusline=%<%f\ \ [%Y%M%R%W]%=%-11(%l,%c%V%)\ \ %P

" setting ; as :
noremap ; :

"making mapped command availables
noremap <leader>, ,
noremap <leader>; ;

" When setting things up, don't forget to install
"
" align         (to have nice column)
" https://github.com/tsaleh/vim-align.git
"
" matchit       (jump between matching syntax construct)
" https://github.com/edsono/vim-matchit.git
"
" ocaml_lwt.vim (lwt syntax extension support)
" git://github.com/raphael-proust/ocaml_lwt.vim.git
"
" pdc           (pandoc files)
" https://github.com/vim-scripts/pdc.vim.git
"
" supertab      (MUST HAVE: do completion with <tab>)
" https://github.com/vim-scripts/SuperTab.git
"
" conque        (a shell in the editor)
" https://github.com/rson/vim-conque.git
"
" surround      (add, edit, remove delimiters)
" https://github.com/vim-scripts/surround.vim.git
"
" zoomwin       (extend <C-w-o> capabilities)
" https://github.com/vim-scripts/ZoomWin.git
"
" gundo         (replace undo list with a graphical tree)
" http://github.com/sjl/gundo.vim.git
"
" fugitive      (command git from within vim)
" https://github.com/tpope/vim-fugitive.git
"
" threesome     (three way merge tool)
" https://github.com/sjl/threesome.vim.git
"
" molokai       (colorscheme)
" https://github.com/tomasr/molokai
