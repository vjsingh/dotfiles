"
" ~/.vimrc
"
" This is your Vim initialization file. It is read on Vim startup.
"
" Change this file to customize your Vim settings.
"
" Vim treats lines beginning with " as comments.
"
" EXAMPLES are available in /usr/local/doc/startups.
"

" Pathogen
call pathogen#infect()
filetype plugin indent on

" colorscheme
"colo desert
"set bg=dark

" to load latex plugin
 filetype plugin on

" something else for latex
" set grepprg=grep\ -nH\ $*

" compile to pdf and use preview
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'open -a Preview'

" one last thing for latex
let g:tex_flavor='latex'

" word wrap w/o line breaks
set formatoptions=1
set linebreak
" move within paragraph
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" make a shortcut to turn off all indentation
nnoremap <C-i> :setl noai nocin nosi inde=<CR>

" auto indent to 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" Set Line Numbers on
set number

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark
"colorscheme mango
colorscheme ir_black
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=magenta

" Have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Have Vim load indentation rules according to the detected filetype. Per
" default Debian Vim only load filetype specific plugins.
if has("autocmd")
  filetype indent on
endif

set showcmd            " Show (partial) command in status line.
set showmatch          " Show matching brackets.
set ignorecase         " Do case insensitive matching
set smartcase          " Do smart case matching, sensitive if UpperCase
"set smartindent        " smart auto intending
set smarttab           " smart tab handling for indenting
set incsearch          " Incremental search
set autowrite          " Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a            " Enable mouse usage (all modes) in terminals

" Make ,t run tbgs for word under curser
"source $ADMIN_SCRIPTS/master.vimrc
"source /home/engshare/admin/scripts/vim/biggrep.vim
"map ,t <Esc>:TBGS <cword><CR>

" Eliminating tailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Make clipboard work with system clipboard
set clipboard=unnamed

" ,cd = cd to pwd of file being edited
map ,cd :cd %:p:h<CR>:pwd<CR>

" stop Vim from beeping all the time
"set vb
"set noflash
"set showmatch
"set ignorecase
"set report=0

" auto indent and number
"set ai
"set nu

" nice tabs
"set tabstop=2
"set ts=2
"set backspace=indent,eol,start

" highlighting
set hlsearch

" CTAGS ctrl + ] to go in ctrl + t to back out
set tags=tags;/

" Red highlighting for text over 80 columns wide
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

" .phpt is php too
"au BufNewFile,BufRead *.php,*.php3,*.php4,*.php5,*.phpt setf php
"au BufNewFile,BufRead *.config setf sh

" bind "gb" to "git blame" for visual and normal mode.
":vmap gb :<C-U>!git blame % -L<C-R>=line("'<") <CR>,<C-R>=line("'>")<CR><CR>
":nmap gb :!git blame %<CR>

 ":map <C-c><C-c> :exe ":cs find c " . expand("<cword>")
 ":map <C-c><C-g> :exe ":cs find g " . expand("<cword>")
 ":map <C-c><C-d> :exe ":cs find d " . expand("<cword>")
 ":map <C-c><C-e> :exe ":cs find e (^\|[^a-zA-Z_])" . expand("<cword>") . "([^a-zA-Z_]\|$)"
 ":map <C-c><C-a> :exe ":cs find e function " . expand("<cword>") . "([^a-zA-Z_]\|$)"
 ":map <C-c><C-b> :exe ":cs find s " . expand("<cword>")
 ":map <C-c><C-f> :cs find f
 ":map <C-c><C-t> :exe ":cs find t " . expand("<cword>")


" Persistent Undo
"if version >= 730
  "set undodir=~/.vim/undodir
  "set undofile
  "set undolevels=1000 "maximum number of changes that can be undone
  "set undoreload=10000 "maximum number lines to save for undo on a buffer reload
"endif

" Use Node.js for Javascript interpretation
let $JS_CMD='node'

" Auto-compile coffee files when saved
"autocmd BufWritePost *.coffee silent CoffeeMake! -b | cwindow

"When a file has been detected to have been changed outside of Vim and it has not been changed inside of Vim, automatically read it again. When the file has been deleted this is not done.
:set autoread
