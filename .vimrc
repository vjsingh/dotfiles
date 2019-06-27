"""""" Plugins """"""
" Use vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'micha/vim-colors-solarized'
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'Galooshi/vim-import-js'
Plug 'tpope/vim-unimpaired'  " Navigating through quicklists and location lists
Plug 'ervandew/supertab'  " To get ultisnips working with YCM
Plug 'SirVer/ultisnips'  " Snippets engine
Plug 'honza/vim-snippets'  " Standard snippets library
"Plug 'vim-scripts/Greplace.vim'  " Multi-file find and replace
Plug 'brooth/far.vim'  " Multi-file find and replace #2
Plug 'danro/rename.vim'  " Rename with ':rename'"
Plug 'https://github.com/lifepillar/vim-solarized8.git'
Plug '/usr/local/opt/fzf'  "like ctrl-p or cmt-t provides fast&fuzzy finding
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'jparise/vim-graphql'  " GraphQL syntax highlighting
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }  " Styled-Components syntax
Plug 'hail2u/vim-css3-syntax'  " css3 syntax for styled components
Plug 'neomake/neomake'  " Typescript Linting
Plug 'leafgarland/typescript-vim'  " Typescript syntax highlighting
"Plug 'peitalin/vim-jsx-typescript' " React JSX syntax highlighting colors (needs typescript-vim)
Plug 'pangloss/vim-javascript'  " Javascript syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'  " JSX + Typescript syntax highlighting
"Plug 'mxw/vim-jsx'  " JSX Syntax
"Plug 'Quramy/tsuquyomi'  " Typescript-IDE
"Plug 'mhartington/nvim-typescript'  "  Alternative to tsuquyomi
Plug 'Shougo/vimproc.vim', {'do' : 'make'}  " Needed for tsuquyomi

" Disable Plugins
"Plug 'Valloric/YouCompleteMe', { 'on': [] }
"Plug 'Quramy/tsuquyomi', { 'on': [] }
"Plug 'leafgarland/typescript-vim', { 'on': [] }
Plug 'peitalin/vim-jsx-typescript', { 'on': [] }
"Plug 'neomake/neomake', { 'on': [] }
"Plug 'hail2u/vim-css3-syntax', { 'on': [] }
"Plug 'styled-components/vim-styled-components', { 'on': [] }
call plug#end()


""""" Ultisnips
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsEditSplit="vertical"
set runtimepath+=~/.vim/my-snippets/
"let g:UltiSnipsSnippetsDir = "~/.vim/snippets"
let g:UltiSnipsSnippetDirectories = ['~/.vim/my-snippets/UltiSnips/', 'UltiSnips']
""""" Ultisnips

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
" Escape special characters in a string for exact matching.
" This is useful to copying strings from the file to the search tool
" Based on this - http://peterodding.com/code/vim/profile/autoload/xolox/escape.vim
function! EscapeString (string)
  let string=a:string
  " Escape regex characters
  let string = escape(string, '^$.*\/~[]')
  " Escape the line endings
  let string = substitute(string, '\n', '\\n', 'g')
  return string
endfunction

" Get the current visual block for search and replaces
" This function passed the visual block through a string escape function
" Based on this - https://stackoverflow.com/questions/676600/vim-replace-selected-text/677918#677918
function! GetVisual() range
  " Save the current register and clipboard
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&

  " Put the current visual selection in the " register
  normal! ""gvy
  let selection = getreg('"')

  " Put the saved registers and clipboards back
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save

  "Escape any special characters in the selection
  let escaped_selection = EscapeString(selection)

  return escaped_selection
endfunction

vmap <C-r> <Esc>:%s/<c-r>=GetVisual()<cr>//g<left><left>

"g:vim_jsx_pretty_highlight_close_tag

" Disable YouCompleteMe
"let g:loaded_youcompleteme = 1
"let g:ycm_semantic_triggers['typescript'] = ['.']

"let g:deoplete#enable_at_startup = 1

"""""""""""""""" Colors fix?  
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

""""" Plugins Config  """"""""
""" Neomake """
" When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
"call neomake#configure#automake('nw', 750)
" Open location list automatically
let g:neomake_open_list = 2
	
let g:neomake_javascript_enabled_makers = ['eslint']

" Map \t to open fuzzy finder <CR> is "enter"
map <leader>t :FZF<CR>
" \f for YCM fixit
map <leader>f :YcmCompleter FixIt<CR>
" \g to organize imports with YCM (java and typescript)
map <leader>g :YcmCompleter OrganizeImports<CR>
" Applies to all files even non-open ones. :copen afterwards to see modified files
map <leader>rf :YcmCompleter RefactorRename 

""""" This has been replaced by Far.vim, but was working
" Multi-file find and replace -- Step 1: Enter string to search for and files
" to search
" function! s:get_visual_selection()
"     " Why is this not a built-in Vim script function?!
"     let [line_start, column_start] = getpos("'<")[1:2]
"     let [line_end, column_end] = getpos("'>")[1:2]
"     let lines = getline(line_start, line_end)
"     if len(lines) == 0
"         return ''
"     endif
"     let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
"     let lines[0] = lines[0][column_start - 1:]
"     return join(lines, "\n")
"   endfunction
" function! MyGReplace()
"   setlocal autoread
"   let textToReplace = s:get_visual_selection()
"   let newText = input('Enter replace pattern: ')
"   "silent! exe "!sed -i 's/" . textToReplace . '/' . newText . "/' */**.tsx"
"   silent! exe "!find . -type f | LANG=C xargs sed -i '' 's/" . textToReplace . '/' . newText . "/g'"
"   "exe ":Gsearch " . text . " */**"
"   :bufdo! e!
"   set autoread<
" endfunction
" function! MyVimFindAndReplace()
"   setlocal autoread
"   let textToReplace = escape(s:get_visual_selection(), '/')
"   let newText = escape(input('Enter replace pattern: '), '/')
"   set hidden
"   set hidden
"   silent! exe ":silent grep " . textToReplace . " */**.tsx"
"   " %sno makes all characters literal, i.e. strings instead of regexes
"   silent! exe ":silent cdo %sno/" . textToReplace . "/" . newText . "/g"
"   silent! exe ":silent cdo update"
" endfunction
" "map <leader>fr :Gsearch 
" map <leader>fr :call MyVimFindAndReplace()<CR>
" " Multi-file find and replace -- Step 2: Save modifications back to files
" "map <leader>w :Greplace<CR>

""""""""" Neovim Config """"""""""
""" Terminal Config """
" Map escape to exit terminal
:tnoremap <Esc> <C-\><C-n>
" Navigate windows from any mode (need to update)
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j<
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

""""""""""""""" vim-jsx-pretty """"""""""""

let g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_colorful_config = 1

"""""""""""""""""""""""""""""""""""""""""""



" Typescript support
" as above, typescript files are typescript.jsx
"let g:neomake_jsx_enabled_makers = ['tsc', 'tslint']
let g:neomake_jsx_enabled_makers = ['tslint']
function! neomake#makers#ft#typescript#EnabledMakers() abort
    return ['tsc', 'tslint']
endfunction

function! neomake#makers#ft#typescript#tsc() abort
    " tsc should not be passed a single file.
    let maker = {
        \ 'args': ['--noEmit', '--watch', 'false', '--pretty', 'false'],
        \ 'append_file': 0,
        \ 'errorformat':
            \ '%E%f %#(%l\,%c): error %m,' .
            \ '%E%f %#(%l\,%c): %m,' .
            \ '%Eerror %m,' .
            \ '%C%\s%\+%m'
        \ }
    let config = neomake#utils#FindGlobFile('tsconfig.json')
    if !empty(config)
        let maker.args += ['--project', config]
    endif
    return maker
endfunction

function! neomake#makers#ft#typescript#tslint() abort
    let maker = {
        \ 'errorformat': '%-G,%EERROR: %f[%l\, %c]: %m,%E%f[%l\, %c]: %m',
        \ }
    let config = neomake#utils#FindGlobFile('tsconfig.json')
    if !empty(config)
        let maker.args = ['--project', config]
        let maker.cwd = fnamemodify(config, ':h')
    endif
    return maker
endfunction

" Call to run tslint fix and then reload current file
function! TSLintFix()
  silent execute "!tslint --fix %"
  edit! %
  Neomake
endfunction

nnoremap <leader>tf :call TSLintFix()<CR>

" Call to run typescript compiler on client
function! TSCompileClient()
  :read !tsc -p ~/Documents/workspace/clyme/
endfunction
command! TSCompileClient call TSCompileClient()


" Set standard file encoding
set encoding=utf8
" No special per file vim override configs
set nomodeline
" Stop word wrapping
set nowrap
    " Except... on Markdown. That's good stuff.
    autocmd FileType markdown setlocal wrap
" Adjust system undo levels
set undolevels=1000
" Use system clipboard
set clipboard=unnamed
" Set tab width and convert tabs to spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" Don't let Vim hide characters or make loud dings
set conceallevel=1
set noerrorbells
" Number gutter
set number
set hlsearch  " Use search highlighting
set incsearch  " Incremental search
set ignorecase  " Do case insensitive matching (needed for smartcase)
set smartcase  " Case-insensitive unless capitals present
set scrolloff=1 " Space above/beside cursor from screen edges
set sidescrolloff=5
" Words with dashes are one word
set iskeyword+=-
set conceallevel=0  " Always show quotes
set showmatch  " Show matching brackets.
set mouse=a            " Enable mouse usage (all modes) in terminals
set autoread  "When a file has been detected to have been changed outside of Vim and it has not been changed inside of Vim, automatically read it again. When the file has been deleted this is not done.
set wrap  " wrap lines visually, i.e. the line is still one line of text, but Vim displays it on multiple lines.


" ,cd = cd to pwd of file being edited
map ,cd :cd %:p:h<CR>:pwd<CR>

"

"filetype plugin indent on
filetype on
filetype plugin on

" always do very magic search
:nnoremap / /\v
:cnoremap %s/ %s/\v

" \vs splits in 2 and sets scrollbind
:noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

"Easy edit of vimrc
nmap \s :source $MYVIMRC<CR>
nmap \v :e ~/.vimrc<CR>

"clear the search buffer, not just remove the highlight
map \c :let @/ = ""<CR>
" also clear buffer with Enter
nmap <CR> :let @/ = ""<CR>

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
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l


" Not sure what these do
"syntax on
" set et
"set sw=4
"set smarttab
"set cursorline
"set cursorcolumn
"set list " turn invisibles on by default
" set title " show in title bar
"set ruler
"set showmode
" set ai " Automatically set the indent of a new line (local to buffer)
" set si " smartindent    (local to buffer)
" set tags=./tags;
" set grepprg=ack
"
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

""""" Not Using """"
" make a shortcut to turn off all indentation
"nnoremap <C-i> :setl noai nocin nosi inde=<CR>
"
" allow backspacing over everything in insert mode
"set backspace=indent,eol,start



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
nnoremap <silent><C-u> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-i> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><C-u> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><C-i> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
vnoremap <silent><C-u> :<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>v`>o
vnoremap <silent><C-i> <Esc>`>:<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>v`<o



"""""" Functions """"""

" w!! to write with sudo
cnoreabbrev <expr> w!!
                \((getcmdtype() == ':' && getcmdline() == 'w!!')
                \?('!sudo tee % >/dev/null'):('w!!'))

" Have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Make directories in path when writing file, if they don't exist
augroup Mkdir
  autocmd!
  autocmd BufWritePre *
    \ if !isdirectory(expand("<afile>:p:h")) |
        \ call mkdir(expand("<afile>:p:h"), "p") |
    \ endif
augroup END



""""""""""""" Color Schemes """"""""""""""""
set termguicolors
"colorscheme mango
"colorscheme ir_black
" colorscheme
"colo desert
" set bg=dark
"set t_Co=256
set background=dark
"syntax enable
"colorscheme solarized8
"colorscheme OceanicNext
"colorscheme onedark
let g:gruvbox_italic=1
colorscheme gruvbox

"highlight Normal guibg=#21242a
"highlight MatchParen guifg=#C678DD guibg=#504066
"highlight LineNr    guifg=#151822
"highlight CursorLineNr guifg=#56B6C2
"highlight Error guifg=#f57373 guibg=#804040
"highlight vimError guifg=#f57373 guibg=#804040

"hi IndentGuidesEven guibg=#21242a guifg=#1f1f28
"hi IndentGuidesOdd guibg=#262a36 guifg=#1f1f28
"hi Comment cterm=italic guifg=#4a5158
"hi String guifg=#98C379 guibg=#2a2e34

""" browns
" function params: numbers and constants
"hi Statement guifg=#907161
"hi Conditional guifg=#907161
"hi Keyword guifg=#56B6C2
"hi Function guifg=#56B6C2

" Yellows
"hi Number guifg=#E5C07B
"hi Special guifg=#E5C07B
"hi Boolean guifg=#E5C07B
"
" purple
"hi CtrlPMatch guifg=#ba9ef7
"hi Visual guibg=#364652

" medium red: if else operators
hi Preproc guifg=#e86868
hi Type guifg=#e86868



"""" vim-jsx-typescript
" set filetypes as typescript.tsx
"autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
"hi xmlTagName guifg=#59ACE5
"hi xmlTag guifg=#59ACE5

" dark blues
"hi xmlEndTag guifg=#2974a1



"""""" vim-jsx ONLY
"
"hi Identifier cterm=italic
"
"" Blues
"" light blues
"hi xmlTagName guifg=#59ACE5
"hi xmlTag guifg=#59ACE5
"
"" dark blues
"hi xmlEndTag guifg=#2974a1
"hi jsxCloseString guifg=#2974a1
"hi htmlTag guifg=#2974a1
"hi htmlEndTag guifg=#2974a1
"hi htmlTagName guifg=#59ACE5
"hi jsxAttrib guifg=#1BD1C1
"
"" cyan
"hi Constant guifg=#56B6C2
"hi typescriptBraces guifg=#56B6C2
"hi typescriptEndColons guifg=#56B6C2
"hi typescriptRef guifg=#56B6C2
"hi typescriptPropietaryMethods guifg=#56B6C2
"hi typescriptEventListenerMethods guifg=#56B6C2
"hi typescriptFunction guifg=#56B6C2
"hi typescriptVars guifg=#56B6C2
"hi typescriptParen guifg=#56B6C2
"hi typescriptDotNotation guifg=#56B6C2
"hi typescriptBracket guifg=#56B6C2
"hi typescriptBlock guifg=#56B6C2
"hi typescriptJFunctions guifg=#56B6C2
"hi typescriptSFunctions guifg=#56B6C2
"hi typescriptInterpolationDelimiter guifg=#56B6C2
"hi typescriptIdentifier guifg=#907161 cterm=italic
"
"" javascript
"hi jsParens guifg=#56B6C2
"hi jsObjectBraces guifg=#C678DD
"hi jsFuncBraces guifg=#56B6C2
"hi jsObjectFuncName guifg=#D19A66
"hi jsObjectKey guifg=#56B6C2<Paste>
