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

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

"filetype plugin indent on
filetype on
filetype plugin on

" Pathogen
call pathogen#infect()
"call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()
"

" Use vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Not using default: call plug#begin('~/.vim/plugged')
call plug#begin('~/.vim/bundle')
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'wincent/command-t'
call plug#end()

"" SYNTASTIC
" Default Options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_exec = 'tidy5'

" Syntax Checkers
let g:syntastic_javascript_checkers=['eslint', 'flow']
"let g:syntastic_javascript_checkers=['flow']
"let g:syntastic_debug=3
let g:syntastic_aggregate_errors = 1  "Aggregate results from multiple checkers

" Have Vim load indentation rules according to the detected filetype. Per
" default Debian Vim only load filetype specific plugins.
if has("autocmd")
    " filetype indent on
endif
syntax on

" Kortina Venmo
" always do very magic search
:nnoremap / /\v
:cnoremap %s/ %s/\v

set number
set et
set sw=4
set smarttab
set incsearch
set hlsearch
set ignorecase
set smartcase
set cursorline
set cursorcolumn
"set list " turn invisibles on by default
" show in title bar
set title
set ruler
set showmode
set showcmd
set ai " Automatically set the indent of a new line (local to buffer)
set si " smartindent    (local to buffer)
set tags=./tags;
set grepprg=ack
"set list
" Words with dashes are one word
set iskeyword+=-

let jslint_command_options = '-conf ~/Dropbox/nix/bin/jsl.conf -nofilelisting -nocontext -nosummary -nologo -process'
"set equalalways " Multiple windows, when created, are equal in size
"set splitbelow splitright"

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark
"colorscheme mango
"colorscheme ir_black
" colorscheme
"colo desert
" set bg=dark
set t_Co=256
set background=dark
colorscheme solarized


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
nnoremap ; :
nmap <silent> ,/ :nohlsearch<CR>
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Navigating location lists (for Syntastic) easily
" C-n for next, C-p for previous, centers line in middle of buffer
" C-m plus number for specific line  -- C-m appears to be in use?
map <C-n> :lne <Enter> zz
map <C-p> :lp <Enter> zz
" map <C-m> :lr 

" w!! to write with sudo
cnoreabbrev <expr> w!!
                \((getcmdtype() == ':' && getcmdline() == 'w!!')
                \?('!sudo tee % >/dev/null'):('w!!'))

" make a shortcut to turn off all indentation
nnoremap <C-i> :setl noai nocin nosi inde=<CR>

" auto indent to 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" Set Line Numbers on
set number

hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=red

" Have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
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
"fun! <SID>StripTrailingWhitespaces()
  "let l = line(".")
  "let c = col(".")
  "%s/\s\+$//e
  "call cursor(l, c)
"endfun

"autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

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


" Kortina Venmo
"autocmd WinEnter * setlocal cursorline
"autocmd WinLeave * setlocal nocursorline
autocmd BufRead,BufNewFile,BufDelete * :syntax on

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

let g:pyflakes_use_quickfix = 0

autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType python setlocal list
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType html set ft=html.django_template " For SnipMate

au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby

" fix backspace in vim 7
:set backspace=indent,eol,start
"nmap <buffer> <CR> gf
"nmap <buffer> <C-S-y> <Esc>yy<Esc>:bd<CR>:edit @"<CR>

" popout split buffer hack
" map <C-S-p>  <Esc>:hide<CR>:blast<CR>

" ctrl-p paste
imap <C-l> <C-r>"

" duplicate line"
" imap <C-D> <Esc>yyp
" nmap <C-D> <Esc>yyp

" insert a markdown header, like
" ==============================
map ,1 V"zy"zpVr=
map ,2 V"zy"zpVr-
"map <leader>h1 VypVr=
"map <leader>h2 VypVr-

"nmap ,bs :ConqueTermSplit bash<CR>
"nmap ,bv :ConqueTermVSplit bash<CR>

" copy all to clipboard
nmap ,a ggVG"*y
" copy word to clipboard
nmap ,d "*yiw
" underline current line, markdown style
nmap ,u "zyy"zp:.s/./-/g<CR>:let @/ = ""<CR>

" delete inner xml tag
nmap ,dit dt<dT>
nmap ,cit dt<cT>

nmap ,t <Leader>t

"clear the fucking search buffer, not just remove the highlight
map \c :let @/ = ""<CR>
" also clear buffer with Enter
nmap <CR> :let @/ = ""<CR>

" Revert the current buffer
" nnoremap \r :e!<CR>

"Easy edit of vimrc
nmap \s :source $MYVIMRC<CR>
nmap \v :e $MYVIMRC<CR>

:runtime! ~/.vim/
":helptags ~/.vim/doc

" \vs splits in 2 and sets scrollbind
:noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>


let g:pydiction_location = '~/.vim/bundle/pydiction/ftplugin/pydiction-1.2/complete-dict'
"##################################################
"# move through CamelCaseWords
"##################################################
" http://vim.wikia.com/wiki/Moving_through_camel_case_words
" Use one of the following to define the camel characters.
" Stop on capital letters.
let g:camelchar = "A-Z"
" Also stop on numbers.
let g:camelchar = "A-Z0-9"
" Include '.' for class member, ',' for separator, ';' end-statement,
" and <[< bracket starts and "'` quotes.
let g:camelchar = "A-Z0-9.,;:{([`'\""
nnoremap <silent><C-Left> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-Right> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><C-Left> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><C-Right> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
vnoremap <silent><C-Left> :<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>v`>o
vnoremap <silent><C-Right> <Esc>`>:<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>v`<o

"##################################################

" https://wincent.com/blog/2-hours-with-vim
"function! AckGrep(command)
"    cexpr system("ack " . a:command)
"    cw " show quickfix window already
"endfunction
"command! -nargs=+ -complete=file Ack call AckGrep(<q-args>)
"map <leader>a :Ack<space>

" prevent comments from going to beginning of line
autocmd BufRead *.py inoremap # X<c-h>#

" turn on python folding when you open a file
" autocmd BufRead *.py set foldmethod=indent
" autocmd BufRead *.py set foldlevel=1

" use spacebar to toggle folding
"nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
"vnoremap <Space> zf


"##################################################
" markdown
"##################################################
 augroup mkd
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
 augroup END

"##################################################
" via http://www.vim.org/scripts/script.php?script_id=30
"##################################################

map  ,cm   :call PythonCommentSelection()<CR>
vmap ,cm   :call PythonCommentSelection()<CR>
map  ,cu   :call PythonUncommentSelection()<CR>
vmap ,cu   :call PythonUncommentSelection()<CR>
" Comment out selected lines
" commentString is inserted in non-empty lines, and should be aligned with
" the block
function! PythonCommentSelection()  range
  let commentString = "#"
  let cl = a:firstline
  let ind = 1000    " I hope nobody use so long lines! :)

  " Look for smallest indent
  while (cl <= a:lastline)
    if strlen(getline(cl))
      let cind = indent(cl)
      let ind = ((ind < cind) ? ind : cind)
    endif
    let cl = cl + 1
  endwhile
  if (ind == 1000)
    let ind = 1
  else
    let ind = ind + 1
  endif

  let cl = a:firstline
  execute ":".cl
  " Insert commentString in each non-empty line, in column ind
  while (cl <= a:lastline)
    if strlen(getline(cl))
      execute "normal ".ind."|i".commentString
    endif
    execute "normal \<Down>"
    let cl = cl + 1
  endwhile
endfunction

" Uncomment selected lines
function! PythonUncommentSelection()  range
  " commentString could be different than the one from CommentSelection()
  " For example, this could be "# \\="
  let commentString = "#"
  let cl = a:firstline
  while (cl <= a:lastline)
    let ul = substitute(getline(cl),
             \"\\(\\s*\\)".commentString."\\(.*\\)$", "\\1\\2", "")
    call setline(cl, ul)
    let cl = cl + 1
  endwhile
endfunction

if findfile('~/Dropbox/Venmo-Devops/gpg/gpg-add-venmo-recipients.vim')
    source ~/Dropbox/Venmo-Devops/gpg/gpg-add-venmo-recipients.vim
endif


command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction
command! -complete=file -nargs=* Gstaged call s:RunShellCommand('git diff --staged')
" command! -complete=file -nargs=* Git call s:RunShellCommand('git '.<q-args>)

function! DoubleWS()
    let pos = getpos('.')
    let reg = getreg('@')
    exe '%s/^\s*/&&/e'
    call setreg('@',reg)
    call setpos('.',pos)
endfunction

function! HalfWS()
    let pos = getpos('.')
    let reg = getreg('@')
    exe '%s#^\s*#\=matchstr(submatch(0),"^.\\{".string(float2nr(len(submatch(0))/2))."\}")#e'
    call setreg('@',reg)
    call setpos('.',pos)
endfunction

nmap ,dws :call DoubleWS()<CR>
nmap ,hws :call HalfWS()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

"" Save and Restore Session
fu! SaveSess()
    "execute 'call mkdir(%:p:h/.vim)'
    "execute 'mksession! %:p:h/.vim/session.vim'
		execute ':mksession! ~/mysession.vim'
endfunction

fu! RestoreSess()
		"execute 'so %:p:h/.vim/session.vim'
		"if bufexists(1)
				"for l in range(1, bufnr('$'))
						"if bufwinnr(l) == -1
								"exec 'sbuffer ' . l
						"endif
				"endfor
		"endif
		execute 'source ~/mysession.vim'
endfunction 
" autocmd VimLeave * call SaveSess()
" autocmd VimEnter * call RestoreSess()
