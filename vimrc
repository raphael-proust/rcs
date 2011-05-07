"I want vim, not vi
set nocompatible

" Pathogen
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
syntax on
filetype plugin indent on

" Change leader to , (comma)
let maplocalleader=","
let mapleader=","

"latex suite
set grepprg=grep\ -nH\ $*
let g:tex_flavor= "latex"

"conq plugin
let g:ConqueTerm_CWInsert = 1
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_Color = 0

"backups plugin
let g:backup_purge=32

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
set nostartofline

"Splits
set splitright
set splitbelow

"Search
set smartcase
set hlsearch

"matching bras and kets
set showmatch

"Status and all
set wildmode=longest,list
set laststatus=2
set showcmd
set ruler
set visualbell
"set lazyredraw

"Lines
set textwidth=80
set nojoinspaces
set wrap

"More history
set history=500
set undolevels=100

"Window and term
set title
set termencoding=utf-8
set encoding=utf-8

"Beautiful additional chars
set list
set listchars=tab:›·,trail:·,extends:#,precedes:#,nbsp:—

"Paste from the outside
set pastetoggle=<F2>
nmap <leader>y "+y
nmap <leader>Y "+yy
nmap <leader>p "+p
nmap <leader>P "+P

"Buffers and window handling
set switchbuf=useopen
map <C-w>! :vertical resize 80<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <F5> :ls<CR>

"Security
set nomodeline

" Highlights long lines
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Ignore irrelevant suffixes for filename completion
set wildignore+=*.a,*.bak,*~,*.swp,*.o,*.info,*.dvi,*.out,*.cmi,*.cmo,*.cma,*.cmx,*.cmxa,*.omc,*.annot,*.exe,*.pyc,*.class

" maps
map Q gq
map <F1> :set hls!<CR>
nmap Y y$
map g0 :tabfirst<CR>
map g$ :tablast<CR>
nnoremap ' `
nnoremap ` '
map <leader>cd :cd %:p:h<CR>

"Delete without a trace
nmap <silent> <leader>d "_d
vmap <silent> <leader>d "_d

"alignement
nmap <leader>al :left<CR>
nmap <leader>ar :right<CR>
nmap <leader>ac :center<CR>
vmap <leader>al :left<CR>
vmap <leader>ar :right<CR>
vmap <leader>ac :center<CR>

"Sanitazation
command Trailing :%s/\s\+$//
command Nbsp :%s/\%d160//<CR>

"Spelling
command Spellfr :setlocal spell | :setlocal spelllang=fr_fr
command Spellus :setlocal spell | :setlocal spelllang=en_us
command Spelluk :setlocal spell | :setlocal spelllang=en_uk

"filetype specific options

au FileType make set noexpandtab

au FileType latex set formatoptions+=a

au FileType pdc set formatoptions+=n

"Status line with a little more information
set statusline=%<%f\ \ [%Y%M%R%W]%=%-11(%l,%c%V%)\ \ %P

"OCaml
let g:ocaml_folding = 0

" setting ; as :
noremap ; :

" When setting things up, don't forget to install
" align         (to have nice column)
" backups       (numbered backups)
" histwin.vim   (history window)
" matchit       (jump between matching syntax construct)
" ocaml_lwt.vim (lwt syntax extension support)
" pdc           (pandoc files)
" supertab      (MUST HAVE: do completion with <tab>)
" vim-conque    (a shell in the editor)
" vim-surround  (add, edit, remove delimiters)
" zoomwin       (extend <C-w-o> capabilities)
