"vim-go

"Jump to definition
au FileType go nmap <leader>d :execute 'GoDef'<CR> 		  

" Find usage
au FileType go nnoremap <leader>f :execute 'GoRef'<CR>
