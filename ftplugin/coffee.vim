" F5 compiles to JS and copies to clipboard
nmap <F5> :up\|!coffee -pc % \| clip<CR>

" F6 does the same but removes the header and (function() {})() wrapper.
" This is useful for generating Greasemonkey scripts with all of the metadata
" comments still at the top.
nmap <F6> :up\|!coffee --bare --no-header -pc % \| clip<CR>
