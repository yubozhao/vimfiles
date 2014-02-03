if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Bundler that knows how to 'make'
NeoBundleFetch 'Shougo/neobundle.vim'

" Run and manage child processes, dependency of many other plugins
NeoBundle 'Shougo/vimproc'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-surround'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'kshenoy/vim-signature'

"Neocomplete {{{
NeoBundle 'Shougo/neocomplete.vim'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"}}}

" I am all in this neo family shit, now for neosnippet, this better be the ONE
" {{{
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
" }}}



" Ultimate UI system for running fuzzy-search on different things {{{
NeoBundle 'Shougo/unite.vim'
" Always start insert mode
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_split_rule = "botright"
" Search settings
if exists("*unite")
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  call unite#filters#sorter_default#use(['sorter_rank'])
  call unite#set_profile('files', 'smartcase', 1)
endif
" search like ctrl p
nnoremap <C-p> :Unite file_rec/async<cr>


"}}}

"shell in my VIM {{{
NeoBundle "Shougo/vimshell"
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '
if has("gui_running")
  let g:vimshell_editor_command = "mvim"
  endif
" }}}

" Tern js settings
NeoBundle 'marijnh/tern_for_vim'
let g:tern_show_argument_hints = 'on_move'

" Color Scheme
NeoBundle 'altercation/vim-colors-solarized'
set t_Co=256
colorscheme solarized
let g:solarized_termcolors = 256
let g:solarized_termtrans = 0 " set to 1 if using transparant background
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"

"" Change color base on time
let hour = strftime("%H")
if (7 <= hour && hour < 19)
  set background=light
else
  set background=dark
endif


" airline config
NeoBundle 'bling/vim-airline'
NeoBundle 'edkolev/tmuxline.vim'
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
set list

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

" Is this for autocomplete?
" imap <Tab> <C-N>

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

" Key Bindings for NerdTree
nnoremap 'o :NERDTreeToggle<CR>
nnoremap 'u :GundoToggle<CR>

" Commands
command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>

" Tern js settings Tern js settings
let g:tern_show_argument_hints = 'on_move'
