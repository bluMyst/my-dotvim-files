" We need nocompatible mode in order to continue lines with backslashes.
" Original setting will be restored.
let s:cpo_save = &cpo
set cpo&vim

" Decorators (new in Python 2.4)
" nextgroup: overrides next match with that highlighting group
" display: doesn't render offscreen stuff. don't use without understanding it.
syn match   pythonDecorator	"@" display nextgroup=pythonFunction skipwhite

" The zero-length non-grouping match before the function name is
" extremely important in pythonFunction.  Without it, everything is
" interpreted as a function inside the contained environment of
" doctests.
" A dot must be allowed because of @MyClass.myfunc decorators.
syn match   pythonFunction
      \ "\%(\%(def\s\|class\s\|@\)\s*\)\@<=\h\%(\w\|\.\)*" contained

" contains: lets you put highlights inside other highlights
syn match   pythonComment	"#.*$" contains=@Spell

" Triple-quoted strings can contain doctests.
syn region  pythonString
      \ start=+[uU]\?\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=Special,@Spell
syn region  pythonString
      \ start=+[uU]\?\z('''\|"""\)+ end="\z1" keepend
      \ contains=Special,pythonSpaceError,@Spell

" python escapes
syn match   Special	+\\[abfnrtv'"\\]+ contained
syn match   Special	"\\\o\{1,3}" contained
syn match   Special	"\\x\x\{2}" contained
syn match   Special	"\%(\\u\x\{4}\|\\U\x\{8}\)" contained
" Python allows case-insensitive Unicode IDs: http://www.unicode.org/charts/
syn match   Special	"\\N{\a\+\%(\s\a\+\)*}" contained
syn match   Special	"\\$"

" excludenl: exclude newline?
" display:   something complex to do with rendering
syn match   pythonSpaceError	display excludenl "\s\+$"

" Sync at the beginning of class, function, or method definition.
syn sync match pythonSync grouphere NONE "^\s*\%(def\|class\)\s\+\h\w*\s*("

hi def link pythonStatement	Statement
hi def link pythonConditional	Conditional
hi def link pythonRepeat	Repeat
hi def link pythonOperator	Operator
hi def link pythonException	Exception
hi def link pythonInclude	Include
hi def link pythonDecorator	Define
hi def link pythonFunction	Function
hi def link pythonComment	Comment
hi def link pythonString	String
hi def link pythonRawString	String
hi def link pythonNumber	Number
hi def link pythonBuiltin	Function
hi def link pythonExceptions	Structure
hi def link pythonSpaceError	Error

let b:current_syntax = "python"

let &cpo = s:cpo_save
unlet s:cpo_save

" vim:set sw=2 sts=2 ts=8 noet:
