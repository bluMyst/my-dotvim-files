" There are a number of options which only have meaning in the GUI version of
" Vim.  These are 'guicursor', 'guifont', 'guipty' and 'guioptions'.  They are
" documented in |options.txt| with all the other options.

" if you write a file multiple times, it'll get sourced multiple times in a row, which is really not good.
"if has("autocmd")
"    autocmd BufWritePost gvimrc source $MYGVIMRC
"endif

" for easy editing of gvimrc.
nmap <Leader>g :edit $MYGVIMRC<CR>

" use this command to try some out:
" :Unite -auto-preview colorscheme
" To see the current one:
" :colorscheme
" To paste it in:
" "=g:colors_name<CR>p
" some good color schemes to try:
" black/dark background
"colorscheme oceanblack
"colorscheme candy
"colorscheme candycode
"colorscheme rdark
colorscheme darkbone
"colorscheme darkspectrum
"colorscheme ir_black
"colorscheme matrix
"colorscheme neverness
"colorscheme rootwater
"colorscheme tir_black
"colorscheme xoria256
"colorscheme zmrok

"colorscheme blacksea

" grey/lightish background
"colorscheme vydark
"colorscheme molokai
"colorscheme atom-dark
"colorscheme anotherdark
"colorscheme clarity
"colorscheme dusk
"colorscheme freya
"colorscheme herald
"colorscheme lucius
"colorscheme maroloccio
"colorscheme moria
"colorscheme neon
"colorscheme no_quarter
"colorscheme night
"colorscheme oceandeep

" white/light background
" colorscheme proton

" Unknown, but kept:
set guioptions='e'

" [G]rey inactive menu items and allow menu items to be [t]orn away.
set guioptions+='gt'

" Use console dialogs instead of popup dialogs for simple choices.
set guioptions+='c'

" Set font.
" Windows uses Font_Name_Here:h[height size]
" Linux uses Font\ Name\ [size]
if has("gui_win32")
    set guifont=Inconsolata:h12,Consolas:h11,Consolas
else
    set guifont=Inconsolata\ 12,Consolas\ 11,Consolas
endif

" No blinking in (a)ll modes.
set guicursor+=a:blinkon0
