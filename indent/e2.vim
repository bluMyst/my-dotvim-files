" Vim indent file
" Language:	Expression 2

" Only load this indent file when no other was loaded.
if exists("b:did_indent") | finish | endif
let b:did_indent = 1

setlocal indentexpr=GetE2Indent()

" To make Vim call GetLuaIndent() when it finds '\s*{' on the current line
setlocal indentkeys+=0={
setlocal autoindent

" Only define the function once.
if exists("*GetE2Indent") | finish | endif

function! GetE2Indent()
  " Find a non-blank line above the current line.
  let prevlnum = prevnonblank(v:lnum - 1)

  " Hit the start of the file, use zero indent.
  if prevlnum == 0 | return 0 | endif

  let ind = indent(prevlnum)
  let prevline = getline(prevlnum)

  let midx = match(prevline, '{\s*$')
  if midx != -1
    " If the previous line isn't a comment.
    " Lua version had a custom highlight class instead of just "Comment"
    if synIDattr(synID(prevlnum, midx + 1, 1), "name") != "Comment"
      let ind = ind + &shiftwidth
    endif
  endif

  " Subtract a 'shiftwidth' on '}'
  " This is the part that requires 'indentkeys'.
  let midx = match(getline(v:lnum), '^\s*}')
  if midx != -1 && synIDattr(synID(v:lnum, midx + 1, 1), "name") != "luaComment"
    let ind = ind - &shiftwidth
  endif
  return ind
endfunction
