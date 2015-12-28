set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Editor Basis
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'mileszs/ack.vim'
Bundle 'kien/rainbow_parentheses.vim'
Plugin 'keith/swift.vim'
Bundle 'sjl/gundo.vim'
Plugin 'bling/vim-airline'
Bundle 'altercation/vim-colors-solarized'
Plugin 'mxw/vim-jsx'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/syntastic'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" jsx in js
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" let eslint does lint check"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']


" Key Bindings for NerdTree
nnoremap 'o :NERDTreeToggle<CR>
nnoremap 'u :GundoToggle<CR>

" key Bindings for ctrl p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


" Tern js settings
"let g:tern_show_argument_hints = 'on_move'

" airline config
set encoding=utf-8
""enable paste detection >
let g:airline_detect_paste=1
""enable/disable detection of whitespace errors.
let g:airline#extensions#whitespace#enabled = 1
""enable/disable tmuxline integration >
let g:airline#extensions#tmuxline#enabled = 1
let g:airline_powerline_fonts = 1


" Settings
syntax on
filetype plugin indent on
set spell spelllang=en_us
set nocompatible
set sh=/bin/bash
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//
set ruler
set number
set expandtab
set laststatus=2
set autoindent
set incsearch
set showcmd
set tabstop=2
set shiftwidth=2
set nowrap
set numberwidth=5
set ignorecase
set smartcase
set tags=./tags;
set guioptions-=T
set guioptions-=r
set foldenable
set foldmethod=manual
set mouse=a
set colorcolumn=80
set textwidth=80
set backspace=indent,eol,start

set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t
" Show hiddent characters
" set list

highlight cursorline gui=none guibg=grey10
set cursorline
highlight NoHightLight gui=none
match NoHightLight /\S\+\(\s\+\|$\)/

let g:snips_trigger_key = '<C-\>'
highlight ColorColumn ctermbg=white

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set nohlsearch
endif

if has("autocmd")
  filetype plugin indent on

  autocmd BufNewFile,BufRead *.txt setfiletype text

  autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

  au FocusLost * :set number
  au InsertEnter * :set number

  augroup vimrcEx
  au!

  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Automatically load .vimrc source when saved
  autocmd BufWritePost .vimrc source $MYVIMRC

  augroup END

else
  set autoindent
endif " has("autocmd")

if has("gui_running")
  " set guifont=Menlo\ Regular:h13
  set guifont=Menlo\ Regular:h11
endif

" Functions
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" Key Bindings
let mapleader = ","

inoremap kj <Esc>
nnoremap <Leader>n :call NumberToggle()<cr>

" Split windows
nnoremap <Leader>s :sp<cr><C-w><C-w>
nnoremap <Leader>v :vsp<cr><C-w><C-w>

" Easily switch between windows
nnoremap <silent> <c-k> :wincmd k<cr>
nnoremap <silent> <c-j> :wincmd j<cr>
nnoremap <silent> <c-h> :wincmd h<cr>
nnoremap <silent> <c-l> :wincmd l<cr>

" Exit insert mode and write file
inoremap <leader>w <Esc> :w<cr>
nnoremap <leader>w :w<cr>

" Commands
command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>
