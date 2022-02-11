"Vundle bootstrap
if !isdirectory(expand("~/.config/nvim/bundle/Vundle.vim/.git"))
  !git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
endif

"Vundle init
set nocompatible
filetype off
set runtimepath+=~/.config/nvim/bundle/Vundle.vim/
call vundle#begin('~/.config/nvim/bundle/')
Plugin 'VundleVim/Vundle.vim'

"Loading the bundles and setting options
Plugin 'tpope/vim-repeat'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
let g:surround_171="« \r »"
let g:surround_187="« \r »"
let g:surround_8249="‹ \r ›"
let g:surround_8216="‘\r’"
let g:surround_8217="‘\r’"
let g:surround_8220="“\r”"
let g:surround_8221="“\r”"
Plugin 'tpope/vim-fugitive.git'
Plugin 'tommcdo/vim-fugitive-blame-ext.git'
Plugin 'will133/vim-dirdiff'
Plugin 'raphael-proust/vacme'
call vundle#end()
filetype plugin indent on

colorscheme vacme


"Vundle post-initialisation phase
filetype plugin indent on
syntax on


"updatetime influences CursorHold events
set updatetime=2000

let maplocalleader=" "
let mapleader="\\"

" Swap , and ; (, is easier)
noremap , ;
noremap ; ,

"save with confirmation
set confirm

"Better diffs (with switchable whitespace ignoring)
set diffopt=filler,vertical,context:5
command Diffall windo diffthis
command Diffnone windo diffoff

"Tabs, indent and the such
set nosmarttab
set noexpandtab
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
set textwidth=80
set nojoinspaces
set wrap
noremap Q gq

"More history
set history=500
set undolevels=500
set undoreload=10000
set undofile
autocmd BufRead,BufNewFile /tmp/* set noundofile
set undodir=$HOME/.config/nvim/undofiles

"Window and term
set title
let &titleold=getcwd()
set termencoding=utf-8
set encoding=utf-8

"Beautiful additional chars
set list
set listchars=tab:▷┄,trail:◇,extends:⌟,precedes:⌜,nbsp:—
set showbreak=›\ 
set fillchars-=vert:\|
set fillchars+=vert:\ 
set fillchars-=fold:-
set fillchars+=fold:—
set fillchars-=diff:-
set fillchars+=diff:—

"Copy-Pasta
nnoremap Y y$

"Buffers and window handling
set switchbuf=usetab,newtab
nnoremap <C-w>! :vertical resize 80<CR>
nnoremap g0 :tabfirst<CR>
nnoremap g$ :tablast<CR>
nnoremap <silent> <Right> :bnext<CR>
nnoremap <silent> <Left> :bprev<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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

" Spelling
command Spellfr :setlocal spell | :setlocal spelllang=fr
command Spellus :setlocal spell | :setlocal spelllang=en_us
command Spellgb :setlocal spell | :setlocal spelllang=en_gb
command Spellno :setlocal nospell

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

" Additional ocaml setup
let s:opam_share_dir = system("opam var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')
execute "set rtp+=" . s:opam_share_dir . "/merlin/vim"
autocmd FileType ocaml nnoremap <LocalLeader>d :MerlinDestruct<CR>
autocmd FileType ocaml nnoremap <LocalLeader>e :MerlinErrorCheck<CR>
autocmd FileType ocaml nnoremap <LocalLeader>t :MerlinTypeOf<CR>
autocmd FileType ocaml nnoremap <LocalLeader>l :MerlinLocate<CR>
autocmd FileType ocaml nnoremap <LocalLeader>co o(**)<Esc>hi
autocmd FileType ocaml nnoremap <LocalLeader>cO O(**)<Esc>hi
autocmd FileType ocaml nnoremap <LocalLeader>ci i(**)<Esc>hi
autocmd FileType ocaml nnoremap <LocalLeader>cI I(**)<Esc>hi
autocmd FileType ocaml nnoremap <LocalLeader>ca a(**)<Esc>hi
autocmd FileType ocaml nnoremap <LocalLeader>cA A(**)<Esc>hi
autocmd FileType ocaml set comments=sr:(*,mb:\ ,ex:*)
