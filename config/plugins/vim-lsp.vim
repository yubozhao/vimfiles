if executable('pyls')
    " pip install python-language-server

    highlight lspReference ctermfg=red guifg=green ctermbg=green guibg=green
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif
