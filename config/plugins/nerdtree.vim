" Nerd Tree 
let NERDChristmasTree=1
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.git$', '\.swp$', '\.jsx.js$', '\.pyc$']
let NERDTreeSortOrder=['\/$','\.rb$','\.py$','\.c$','\.js$','*','.txt$','.md$']

" Toggle to display nerdtree menu
nnoremap <silent> <F5> :execute 'NERDTreeToggle ' . getcwd()<CR>
nnoremap <leader>o :execute 'NERDTreeToggle ' . getcwd()<CR>

" close vim if the only window left is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
