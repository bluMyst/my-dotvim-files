" Vim syntax file
" Language: Expression 2

" BUG: entity() is highlighted as a type.

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn match  Comment "#.*$" contains=Todo
syn region Comment start="#\[" end=/]#/ contains=Todo
syn keyword Todo FIXME NOTE NOTES TODO XXX contained

syn region String start=/"/ end=/\v\\@<!"/ contains=Special
syn match  Special +\v\\[n"]+

syn keyword Repeat while for foreach
syn keyword Keyword continue break function return local
syn keyword Conditional if elseif else

" the > at the end is a word ending
" can't just do "syn keyword @name ..." because @ is treated specially as some
" kind of syntax thingie so I have to do it the hard way with a regular
" expression.
syn match PreProc "\v\@(name|inputs|outputs|persist|trigger|model)>"

syn keyword Type number string entity vector matrix angle table void array bone wirelink complex quaternion

syn match PreCondit "\v#(ifdef|else|endif)>"
syn match Keyword "\v<#include>"
syn match Number "\v<\d+>"

" math stuff
syn keyword Function mod sqrt cbrt root e exp ln log2 log10 log abs
syn keyword Function ceil floor round int frac clamp inrange sign min max
syn keyword Function random randint
syn keyword Function pi toRad toDeg
syn keyword Function sin cos tan cot sec csc asin acos atan

" entity things
syn keyword Function owner noentity players

" vector
syn keyword Function vec2 vec vec4 randvec toWorld toLocal
syn keyword Function bearing elevation heading

" angle
syn keyword Function ang angnorm

" bone
syn keyword Function nobone

" core
syn keyword Function first duped dupefinished inputClk reset exit
syn keyword Function runOnLast last removing

" self-aware
syn keyword Function concmd
syn keyword Function applyForce applyOffsetForce applyAngForce applyTorque 
syn keyword Function selfDestruct selfDestructAll

" debug
syn keyword Function print hint printTable printColor

" timer / time-related
syn keyword Function runOnTick tickClk curtime realtime interval timer
syn keyword Function stoptimer clk curtime realtime systime date dateUTC time

" chat
syn keyword Function runOnChat chatClk hideChat
syn keyword Function lastSpoke lastSaid lastSaidWhen lastSaidTeam

" sound playback
syn keyword Function soundPlay soundStop soundPitch soundVolume soundPurge soundDuration

let b:current_syntax = "e2"
