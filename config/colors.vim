if has("gui_running")
    set t_Co=256
    set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h12
    set guioptions-=r " Removes right hand scroll bar
    set background=dark
    colorscheme gruvbox
else
    if has('nvim')
        set termguicolors
        set t_Co=256
        set background=dark
        set guifont=SFMono\ Nerd\ Font:h12
        let g:gruvbox_contrast_dark="soft"
        colorscheme gruvbox
        " colorscheme zenburn
        " colorscheme solarized8_low
        " colorscheme jellybeans
    else
        set t_Co=256
        set background=dark
        colorscheme gruvbox
    endif
endif
