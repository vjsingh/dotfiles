"""""" Plugins """"""
" Use vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

" Color Schemes
Plug 'micha/vim-colors-solarized'
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'
Plug 'haishanh/night-owl.vim'
Plug 'morhetz/gruvbox'

" Vim Config
Plug 'embear/vim-localvimrc'

Plug 'yegappan/taglist'
Plug 'Galooshi/vim-import-js'
Plug 'tpope/vim-unimpaired'  " Navigating through quicklists and location lists
"Plug 'ervandew/supertab'  " To get ultisnips working with YCM
Plug 'SirVer/ultisnips'  " Snippets engine
Plug 'honza/vim-snippets'  " Standard snippets library
"Plug 'vim-scripts/Greplace.vim'  " Multi-file find and replace
Plug 'brooth/far.vim'  " Multi-file find and replace #2
Plug 'danro/rename.vim'  " Rename with ':rename'"
Plug 'https://github.com/lifepillar/vim-solarized8.git'
Plug 'junegunn/fzf.vim'  "like ctrl-p or cmt-t provides fast&fuzzy finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'jparise/vim-graphql'  " GraphQL syntax highlighting
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }  " Styled-Components syntax
Plug 'hail2u/vim-css3-syntax'  " css3 syntax for styled components
"Plug 'neomake/neomake'  " Typescript & eslint linting
"Plug 'w0rp/ale' " Typescript & eslint linting
Plug 'leafgarland/typescript-vim'  " Typescript syntax highlighting
Plug 'peitalin/vim-jsx-typescript' " React JSX syntax highlighting colors (needs typescript-vim)
Plug 'pangloss/vim-javascript'  " Javascript syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'  " JSX + Typescript syntax highlighting
"Plug 'mxw/vim-jsx'  " JSX Syntax
"Plug 'Quramy/tsuquyomi'  " Typescript-IDE
"Plug 'mhartington/nvim-typescript'  "  Alternative to tsuquyomi
"Plug 'Shougo/vimproc.vim', {'do' : 'make'}  " Needed for tsuquyomi
"Plug 'benjie/neomake-local-eslint.vim'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Disable Plugins
"Plug 'peitalin/vim-jsx-typescript', { 'on': [] }
Plug 'w0rp/ale', { 'on': [] }
Plug 'neomake/neomake', { 'on': [] }
Plug 'ervandew/supertab', { 'on': [] }
Plug 'Shougo/vimproc.vim', { 'on': [] }
"Plug 'Valloric/YouCompleteMe', { 'on': [] }
"Plug 'Quramy/tsuquyomi', { 'on': [] }
"Plug 'leafgarland/typescript-vim', { 'on': [] }
"Plug 'hail2u/vim-css3-syntax', { 'on': [] }
"Plug 'styled-components/vim-styled-components', { 'on': [] }
call plug#end()

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

filetype on
filetype plugin on
"filetype plugin indent on

" always do very magic search
:nnoremap / /\v
:cnoremap %s/ %s/\v

" \vs splits in 2 and sets scrollbind
:noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

"Easy edit of vimrc
nmap \b :source $MYVIMRC<CR>
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

" Python
let g:python_host_prog = '/Users/Varun/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/Varun/.pyenv/versions/neovim3/bin/python'

" Local Vimrc
let g:localvimrc_whitelist=['/Users/Varun/Documents/workspace/*']

" Ultisnips
" Make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'
" Better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<C-n>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"
set runtimepath+=~/.vim/my-snippets/
"let g:UltiSnipsSnippetsDir = "~/.vim/snippets"
let g:UltiSnipsSnippetDirectories = ['~/.vim/my-snippets/UltiSnips/', 'UltiSnips']
map <leader>q :e ~/.vim/my-snippets/Ultisnips/typescript.snippets<CR>

"g:vim_jsx_pretty_highlight_close_tag

" Disable YouCompleteMe
let g:loaded_youcompleteme = 1
"let g:deoplete#enable_at_startup = 1

"""""""""""""""" Colors fix?  
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

""""" Plugins Config  """"""""

" \f for YCM fixit
"map <leader>f :YcmCompleter FixIt<CR>
" \g to organize imports with YCM (java and typescript)
"map <leader>g :YcmCompleter OrganizeImports<CR>
" Applies to all files even non-open ones. :copen afterwards to see modified files
"map <leader>rf :YcmCompleter RefactorRename 

" vim-closetag options
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.tsx,*.html,*.xhtml,*.phtml'
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml'
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1
" dict
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

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

" Make syntax highlighting work in large JSX files
" https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
"syntax sync minlines=20



nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"""""""""""""""""""""""""""""""""""""""""""
" Tags from taglist
"""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>e :TlistOpen <CR>
let Tlist_Close_On_Select = 1
let Tlist_WinWidth = 60



"""""""""""""""""""""""""""""""""""""""""""
" FzF
"""""""""""""""""""""""""""""""""""""""""""
map <leader>t :Files<CR>
map <leader>r :Buffers<CR>
" RipGrep
nnoremap <silent> <leader>s :Rg <C-R><C-W><CR>

function RgOneResultPerFile(query, fullscreen)
  call fzf#vim#grep(
              \   'rg --column --line-number --no-heading --color=always --smart-case --files-with-matches -- '.shellescape(a:query), 1,
              \   fzf#vim#with_preview(), a:fullscreen)
endfunction
"nnoremap <silent> <leader>w :call RgOneResultPerFile(<q-args>)<CR>
command! -nargs=* -bang RGFiles call RgOneResultPerFile(<q-args>, <bang>0)

command! -nargs=1 GJ vimgrep <q-args> % | copen



"""""""""""""""""""""""""""""""""""""""""""
" Typescript support
"""""""""""""""""""""""""""""""""""""""""""

""""""""""""""" COC """"""""""""
" Things I added
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-python',
  \ 'coc-ultisnips'
  \ ]
command! -nargs=0 Prettier :CocCommand prettier.formatFile
"Mappings
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>

" From default config
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>n <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>f  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Organize imports of the current buffer.
function OrganizeImports()
    :call CocAction('runCommand', 'editor.action.organizeImport')
    ":sleep 2000m
    ":call CocAction('runCommand', 'eslint.executeAutofix')
    :sleep 1m
    ":w | Prettier
    :w
    :sleep 1000m
    :Prettier
endfunction
map <leader>g :exec OrganizeImports()<CR>

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
function! _blockcomment()
    """ ALE """
    let g:ale_sign_error = '✘'
    let g:ale_sign_warning = '⚠'
    highlight ALEErrorSign ctermbg=NONE ctermfg=red
    highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

    "\   'typescript': ['tsserver'],
    let g:ale_fixers = {
    \  'javascript': ['eslint'],
    \  'typescript': ['eslint'],
    \}
    let g:ale_linters = {
    \  'javascript': ['eslint'],
    \  'typescript': ['eslint', 'tsserver', 'standard', 'typecheck', 'xo'],
    \}
    let g:ale_linters_explicit = 1

    let g:ale_fix_on_save = 1

    nmap <silent> <C-j> :ALENext<cr>
    nmap <silent> <C-k> :ALEPrevious<cr>
endfunction
""""""""""""""" END COC """"""""""""


""" Neomake """
function! _blockcomment()
    " When writing a buffer (no delay).
    " TODO: Enable this
    call neomake#configure#automake('w')
    " When writing a buffer (no delay), and on normal mode changes (after 750ms).
    "call neomake#configure#automake('nw', 750)
    " Open location list automatically
    let g:neomake_open_list = 2
      
    "let g:neomake_javascript_enabled_makers = ['eslint']
    " as above, typescript files are typescript.jsx
    "let g:neomake_jsx_enabled_makers = ['tsc', 'tslint']
    "let g:neomake_jsx_enabled_makers = ['tsc', 'eslint']
    function! neomake#makers#ft#typescript#EnabledMakers() abort
        "return ['tsc', 'tslint']
        "return ['tsc', 'eslint']
        return ['tsc']
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

    "function! neomake#makers#ft#typescript#tslint() abort
    function! neomake#makers#ft#typescript#eslint() abort
        let maker = {
            \ 'errorformat': '%-G,%EERROR: %f[%l\, %c]: %m,%E%f[%l\, %c]: %m',
            \ }
        let config = neomake#utils#FindGlobFile('tsconfig.json')
        if !empty(config)
            "let maker.args = ['--project', config]
            let maker.cwd = fnamemodify(config, ':h')
        endif
        return maker
    endfunction

    " Call to run eslint fix and then reload current file
    function! ESLintFix()
      silent execute "!eslint --fix %"
      edit! %
      "Neomake
    endfunction

    nnoremap <leader>ef :call ESLintFix()<CR>

    " Call to run typescript compiler on client
    function! TSCompileClient()
      :read !tsc -p ~/Documents/workspace/clyme/
    endfunction
    command! TSCompileClient call TSCompileClient()
endfunction



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
"nnoremap <silent><C-u> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
"nnoremap <silent><C-i> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
"inoremap <silent><C-u> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
"inoremap <silent><C-i> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
"vnoremap <silent><C-u> :<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>v`>o
"vnoremap <silent><C-i> <Esc>`>:<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>v`<o



"""""" Functions """"""
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
"colorscheme night-owl

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
