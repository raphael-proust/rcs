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

Bundle 'vim-scripts/SuperTab.git'

"languages
Bundle 'rc.vim'
let s:ocamlmerlin=substitute(system('opam config var share'),'\n$','','''') .  "/ocamlmerlin"
execute "set rtp+=".s:ocamlmerlin."/vim"
execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
Bundle 'def-lkb/merlin', {'rtp': 'vim/merlin/'}
Bundle 'def-lkb/vimbufsync'
Bundle 'raphael-proust/pdc.vim.git'

Bundle 'vim-scripts/surround.vim.git'
"French typographic rules impose non-breakable space
let g:surround_171="« \r »"
let g:surround_8249="‹ \r ›"

Bundle 'sjl/gundo.vim.git'
nnoremap <F3> :GundoToggle<CR>

Bundle 'tpope/vim-fugitive.git'

"Vundle post-initialisation phase
filetype plugin indent on
syntax on
Bundle 'raphael-proust/molokai.git'
Bundle 'Solarized'
set background=light
colorscheme solarized

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

"Tabs, indent and the such
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
nnoremap <F1> :set hls!<CR>
inoremap <F1> <Nop>
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
nnoremap Q gq
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
let &titleold=getcwd()
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
nnoremap <leader>y "+y
nnoremap <leader>Y "+y$
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap Y y$

"Buffers and window handling
set switchbuf=usetab,newtab
nnoremap <C-w>! :vertical resize 78<CR>
nnoremap g0 :tabfirst<CR>
nnoremap g$ :tablast<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> <Right> :bnext<CR>
nnoremap <silent> <Left> :bprev<CR>

"in command mode use <C-j/k> for history and <C-h/l> for moving
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>

" Highlights long lines
set colorcolumn=+1

" Ignore irrelevant suffixes for filename completion
set wildignore+=*.a,*.bak,*~,*.swp,*.o,*.info,*.out,*.exe,*.pyc,*.class
set wildignore+=*.dvi,*.pdf,*.bbl,*.aux,*.bbl,*.blg
set wildignore+=*.cmi,*.cmo,*.cma,*.cmx,*.cmxa,*.omc,*.annot,*.byte,*.native

" various maps
nnoremap ' `
nnoremap ` '
nnoremap <leader>cd :cd %:p:h<CR>
nnoremap K :.-,.join<CR>

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
au BufEnter,BufNewFile,BufRead * call FileTypeDetect()
fun! FileTypeDetect()
	let l = getline(nextnonblank(1))
	if l =~ '#!/bin/dash'
		set filetype=sh
	endif
endfun

"On the fly sudo
command Sudow :w !sudo tee %

"Status line with a little more information
function SpellLang()
	if &spell | return ',' . &spelllang | else | return '' | endif
endfunction
set statusline=%<%f%q\ \ [%Y%M%R%W%{SpellLang()}]%=%-11(%l,%c%V%)\ \ %P

if &term =~ "st.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif
