" generates a hashtable which defines the colors for each highlight group
function! airline#themes#generate_color_map(section1, section2, section3)
  "                         guifg           guibg           ctermfg         ctermbg         gui/term
  return {
      \ 'mode':           [ a:section1[0] , a:section1[1] , a:section1[2] , a:section1[3] , 'bold' ] ,
      \ 'mode_separator': [ a:section1[1] , a:section2[1] , a:section1[3] , a:section2[3] , 'bold' ] ,
      \ 'info':           [ a:section2[0] , a:section2[1] , a:section2[2] , a:section2[3] , ''     ] ,
      \ 'info_separator': [ a:section2[1] , a:section3[1] , a:section2[3] , a:section3[3] , 'bold' ] ,
      \ 'statusline':     [ a:section3[0] , a:section3[1] , a:section3[2] , a:section3[3] , ''     ] ,
      \ }
endfunction
