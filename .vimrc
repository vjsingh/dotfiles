"""""" Plugins """"""
" Use vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

" Color Schemes
Plug 'morhetz/gruvbox'

" Vim Config
"Plug 'embear/vim-localvimrc'
"Plug 'yegappan/taglist'
"Plug 'Galooshi/vim-import-js'
"Plug 'tpope/vim-unimpaired'  " Navigating through quicklists and location lists
"Plug 'ervandew/supertab'  " To get ultisnips working with YCM
"Plug 'SirVer/ultisnips'  " Snippets engine
"Plug 'honza/vim-snippets'  " Standard snippets library
"Plug 'vim-scripts/Greplace.vim'  " Multi-file find and replace
"Plug 'brooth/far.vim'  " Multi-file find and replace #2
"Plug 'danro/rename.vim'  " Rename with ':rename'
"Plug 'https://github.com/lifepillar/vim-solarized8.git'
"Plug 'junegunn/fzf.vim'  "like ctrl-p or cmt-t provides fast&fuzzy finding
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
"Plug 'jparise/vim-graphql'  " GraphQL syntax highlighting
"Plug 'styled-components/vim-styled-components', { 'branch': 'main' }  " Styled-Components syntax
"Plug 'hail2u/vim-css3-syntax'  " css3 syntax for styled components
"Plug 'neomake/neomake'  " Typescript & eslint linting
"Plug 'w0rp/ale' " Typescript & eslint linting
"Plug 'leafgarland/typescript-vim'  " Typescript syntax highlighting
"Plug 'peitalin/vim-jsx-typescript' " React JSX syntax highlighting colors (needs typescript-vim)
"Plug 'pangloss/vim-javascript'  " Javascript syntax highlighting
"Plug 'maxmellon/vim-jsx-pretty'  " JSX + Typescript syntax highlighting
"Plug 'mxw/vim-jsx'  " JSX Syntax
"Plug 'Quramy/tsuquyomi'  " Typescript-IDE
"Plug 'mhartington/nvim-typescript'  "  Alternative to tsuquyomi
"Plug 'Shougo/vimproc.vim', {'do' : 'make'}  " Needed for tsuquyomi
"Plug 'benjie/neomake-local-eslint.vim'
"Plug 'alvan/vim-closetag'
"Plug 'tpope/vim-surround'
"Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Disable Plugins
"Plug 'peitalin/vim-jsx-typescript', { 'on': [] }
Plug 'SirVer/ultisnips', {'on':[]}
Plug 'w0rp/ale', { 'on': [] }
Plug 'neomake/neomake', { 'on': [] }
Plug 'ervandew/supertab', { 'on': [] }
Plug 'Shougo/vimproc.vim', { 'on': [] }
Plug 'leafgarland/typescript-vim', { 'on': [] }
Plug 'peitalin/vim-jsx-typescript', { 'on': [] }
Plug 'pangloss/vim-javascript', { 'on': [] }
Plug 'maxmellon/vim-jsx-pretty', { 'on': [] }

"Plug 'Valloric/YouCompleteMe', { 'on': [] }
"Plug 'Quramy/tsuquyomi', { 'on': [] }
"Plug 'leafgarland/typescript-vim', { 'on': [] }
"Plug 'hail2u/vim-css3-syntax', { 'on': [] }
"Plug 'styled-components/vim-styled-components', { 'on': [] }
call plug#end()

set background=dark
colorscheme gruvbox


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
