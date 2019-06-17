setlocal colorcolumn=79
set textwidth=79

" Auto-wrap [t]ext and [c]omments
setlocal formatoptions+=tc

" Allows running and debugging
nmap <F5> :up\|!python %<CR>
nmap <F6> :up\|!python -m pdb %<CR>
