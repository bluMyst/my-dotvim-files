" There are a number of options which only have meaning in the GUI version of
" Vim.  These are 'guicursor', 'guifont', 'guipty' and 'guioptions'.  They are
" documented in |options.txt| with all the other options.

if has("autocmd")
    autocmd BufWritePost gvimrc source $MYGVIMRC
endif

" for easy editing of gvimrc.
nmap <Leader>g :edit $MYGVIMRC<CR>

" use this command to try some out:
" :Unite -auto-preview colorscheme
" To see the current one:
" :colorscheme
" To paste it in:
" "=g:colors_name<CR>p
colorscheme oceanblack

" Unknown, but kept:
set guioptions='e'

" [G]rey inactive menu items and allow menu items to be [t]orn away.
set guioptions+='gt'

" Use console dialogs instead of popup dialogs for simple choices.
set guioptions+='c'

" Set font.
set guifont=DejaVu\ Sans\ Mono\ Book\ 10

" Configure the cursor.
set guicursor+=a:blinkon0 " No blinking in (a)ll modes.
