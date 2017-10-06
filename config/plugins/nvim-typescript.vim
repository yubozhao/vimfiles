"nvim-typescript

"Jump to definition
au FileType typescript nmap <leader>d :execute 'TSDefPreview'<CR> 		  

" Find usage
au FileType typescript nnoremap <leader>r :execute 'TSRef'<CR>

" Rename in the file
function! ReplaceIt()
  call inputsave()
  let replacement = input('Enter rename:')
  call inputrestore()
  execute 'TSRename '.replacement
endfunction

au FileType typescript nnoremap <silent> <F2> :call ReplaceIt()<CR>
