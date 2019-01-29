"!Plug.vim
call plug#begin('~/.local/share/nvim/plugged')

Plug 'xolox/vim-misc'
Plug 'tpope/vim-sensible'

Plug 'bling/vim-airline'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/nerdcommenter'

Plug 'shougo/denite.nvim'

Plug 'vim-syntastic/syntastic'

Plug 'tpope/vim-fugitive'

Plug 'easymotion/vim-easymotion'

Plug 'tpope/vim-surround'

Plug 'mg979/vim-visual-multi'

" Code auto completion in neovim
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for': ['javascript', 'javascript.jsx'] }
    Plug 'zchee/deoplete-jedi', { 'for': 'python' } " python code auto completion
else
    Plug 'Shougo/neocomplete.vim'
endif

" Auto completion for quotes, parens, brackets
Plug 'Raimondi/delimitMate'

" LSP (lanuage service protocol) support
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" General plugin
Plug 'jkirchartz/writegooder.vim'

""" Language specific plugins

" scala
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
"Plug 'ensime/ensime-vim'

" Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' }

" docker
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }

" jsonnet
Plug 'google/vim-jsonnet', { 'for': 'jsonnet' }

" javascript
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jsdoc-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/html5.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'elzr/vim-json', { 'for': 'json' }

" typescript
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript', 'typescript.tsx'] }
" Plug 'mhartington/nvim-typescript', { 'do': 'npm install -g typescript', 'for': ['typescript', 'tsx', 'typescript.tsx'] }
Plug 'mhartington/nvim-typescript', {'do': ':!install.sh \| UpdateRemotePlugins', 'for': ['typescript', 'tsx', 'typescript.tsx'] }

" Bazel
Plug 'google/vim-ft-bzl', { 'for': 'bzl' }

" golang
Plug 'fatih/vim-go', { 'for': ['golang', 'go'] }

call plug#end()

" use the correct python
if exists("$VIRTUAL_ENV")
    let g:python_host_prog=substitute(system("which -a python2 | head -n2 | tail -n1"), "\n", '', 'g')
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python_host_prog=substitute(system("which python2"), "\n", '', 'g')
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif
let g:python3_host_prog='/usr/local/anaconda3/bin/python'


" Basic settings and key bindings
source ~/.vim/config/general.vim

" additional configs
source ~/.vim/config/colors.vim
source ~/.vim/config/emacs.vim
source ~/.vim/config/lastcursor.vim
source ~/.vim/config/numbering.vim
source ~/.vim/config/search.vim

" Plugin configurations
source ~/.vim/config/plugins/airline.vim
source ~/.vim/config/plugins/denite.vim
source ~/.vim/config/plugins/syntastic.vim
source ~/.vim/config/plugins/gitgutter.vim
source ~/.vim/config/plugins/nerdtree.vim
source ~/.vim/config/plugins/vim-go.vim
source ~/.vim/config/plugins/nvim-typescript.vim
source ~/.vim/config/plugins/vim-fugitive.vim
source ~/.vim/config/plugins/easy-motion.vim
source ~/.vim/config/plugins/vim-jsonnet.vim
source ~/.vim/config/plugins/oco-nvim.vim
if has('nvim') " neovim only plugin
    source ~/.vim/config/plugins/deoplete.vim
else
    source ~/.vim/config/plugins/neocomplete.vim
endif
