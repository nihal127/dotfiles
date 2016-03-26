" ╻┏┓╻╻╺┳╸ ╻ ╻╻┏┳┓
" ┃┃┗┫┃ ┃  ┃┏┛┃┃┃┃
" ╹╹ ╹╹ ╹ ╹┗┛ ╹╹ ╹
" init.vim written with extensibility in mind

set nocompatible              " be iMproved, required
filetype off                  " required

" Plugins {{{

  call plug#begin('~/.config/nvim/bundle')

  " File tree. Sometimes useful and sometimes it looks good
  Plug 'scrooloose/nerdtree'

  " For obvious reasons
  Plug 'ntpeters/vim-better-whitespace'

  " Statusline
  Plug 'itchyny/lightline.vim'

  " Syntax plugins
  Plug 'gabrielelana/vim-markdown'
  Plug 'othree/html5.vim'

  " Simple tab completion
  Plug 'Shougo/deoplete.nvim'
  Plug 'zchee/deoplete-clang'

  " Syntax checking
  Plug 'scrooloose/syntastic'

  " Show changes
  Plug 'airblade/vim-gitgutter'

  " One plugin to rule them all
  Plug 'sheerun/vim-polyglot'

  call plug#end()              " required
  filetype plugin indent on    " required

" }}}

" Essential things {{{

  " Syntax and tabs
  syntax enable " Enable syntax highlighting, duh
  set number    " Looks better
  set tabstop=2
  set expandtab
  set shiftwidth=2
  set smartindent
  set cindent
  " Make things snappy
  set updatetime=250
  " Fold markers
  set fdm=marker
  " ingorecase + smartcase
  set ignorecase
  set smartcase
  " Make it natural
  set splitright

  " Nope
  set noswapfile
  " Set backup/undo dirs
  set backupdir=~/.config/nvim/tmp/backups/
  set undodir=~/.config/nvim/tmp/undo/

  " Make the folders automatically if they don't already exist.
  if !isdirectory(expand(&backupdir))
  	call mkdir(expand(&backupdir), "p")
  endif

  if !isdirectory(expand(&undodir))
  	call mkdir(expand(&undodir), "p")
  endif

  " Make undo work after the file is closed
  set undofile
  set undolevels=500
  set undoreload=500

" }}}

" Keybindings {{{

  " C-d to hide find results
  nnoremap <silent> <C-d> :noh<CR>
  tnoremap <Esc> <C-\><C-n>

" }}}

" Colors {{{

  set background=dark
  colo shblah
" }}}

" NERD things {{{

  " Toggle NERDTree
  map <C-n> :NERDTreeToggle<CR>

" }}}

" Statusline {{{

  set laststatus=2 " Make the bar permanent
  let g:lightline = {
    \ 'colorscheme': 'cloudy',
    \ 'active': {
    \   'left': [ [ 'filename' ],
    \             [ 'readonly' ] ],
    \   'right': [ [ 'percent', 'lineinfo' ],
    \              [ 'fileencoding', 'filetype' ],
    \              [ 'fileformat', 'syntastic' ] ]
    \ },
    \ 'separator': { 'left': '▓▒░', 'right': '░▒▓' },
    \ 'subseparator': { 'left': '▒', 'right': '░' }
    \ }

" }}}

" Clipboard setting {{{

  set clipboard^=unnamed,unnamedplus

" }}}

" Word wrapping {{{

  set wrap
  set linebreak
  set nolist
  set textwidth=0
  set wrapmargin=0

" }}}

" Completion {{{

  let g:deoplete#enable_at_startup = 1

  " C/C++ things
  let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
  let g:deoplete#sources#clang#clang_header = '/usr/include/clang/'
  " C or C++ standard version
  let g:deoplete#sources#clang#std#c = 'c11'
  " or c++
  let g:deoplete#sources#clang#std#cpp = 'c++11'

  " Tab completion
  imap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()

  function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction"}}}

" }}}

" Syntax checking {{{

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

" }}}
