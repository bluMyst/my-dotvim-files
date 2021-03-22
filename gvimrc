" There are a number of options which only have meaning in the GUI version of
" Vim.  These are 'guicursor', 'guifont', 'guipty' and 'guioptions'.  They are
" documented in |options.txt| with all the other options.

" Automatically source gvimrc on write from inside vim.
" if has("autocmd")
"     autocmd BufWritePost gvimrc source $MYVIMRC
" endif

" Good website for choosing a colorscheme:
" http://colorswat.ch/vim/list

" See the plugins in vimrc for a list of colorschems you can choose from.
colorscheme dracula

" Use [c]onsole dialogs instead of popup dialogs
set guioptions='c'

" [G]rey inactive menu items
" Menu options can be [t]orn away
set guioptions+='gt'

" Show [m]enu bar (you can edit it!)
"set guioptions+='m'

" No gui tabs (not the character; think Firefox). Use normal command-line tabs.
"set guioptions+='e'

" Use console dialogs instead of popup dialogs for simple choices.
" set guioptions+='c'

" Set font.
" Windows uses Font_Name_Here:h[height size]
" Linux uses Font\ Name\ [size]
" NOTE: For vim-airline to work properly, we need a powerline-patched font
" (InputMono is patched out-of-the-box)
if has("unix") && system("hostname -s") == "hermes\n"
    " set guifont=InputMono\ 10,Consolas\ 11,Consolas
    set guifont=Noto\ Mono\ 10,Consolas\ 11,Consolas
elseif has("gui_win32")
    " set guifont=InputMono:h12,Consolas:h11,Consolas
    set guifont=Noto\ Mono:h12,Consolas:h11,Consolas
else
    " set guifont=InputMono\ 12,Consolas\ 11,Consolas
    set guifont=Noto\ Mono\ 12,Consolas\ 11,Consolas
endif

" No blinking in (a)ll modes.
set guicursor+=a:blinkon0
