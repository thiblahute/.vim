" Vim syntax file
" Language : Self defined simple markup for notes in Vim
" Author/Maintainer : Samhita Kasula
" Last Modified : 2008 Sept 20

if exists("b:current_syntax")
  finish
endif

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif



" TODO  or FIXME nested in a comment
syn keyword notesTodo contained TODO FIXME

" Title, Author of the text
syn match notesTitle  /__Title__:/
syn match notesAuthor  /__Author__:/

syn match notesTitleBody  /\(__Title__:\)\@<=.*$/
syn match notesAuthorBody  /\(__Author__:\)\@<=.*$/


" Comments are enclosed within // //
" matched in a single line only
syn region notesComment start=+//+  end=+//+ oneline contains=notesTodo
syn region notesHighlitLine start=+__+  end=+__+ oneline contains=notesTodo
syn match notesImply /^=>.*$/ contains=notesTodo

" Sentences starting with - or * are bullets
syn match notesBullet /^\s*- /
syn match notesBullet /^\s*\* /
syn match notesBullet /^\s*+ /

" Highlighting section(=) and subsection(-)
syn match notesSection /.*\(\n=\{3,60\}\([^=]\|\n\|\s\)\)\@=/ contains=@Section
syn match notesSection /.*\(\n\s\+=\{3,60\}\([^=]\|\n\|\s\)\)\@=/ contains=@Section
syn match notesSubsection /.*\(\n-\{3,60\}\([^-]\|\n\|\s\)\)\@=/ contains=@Section
syn match notesSubsection /.*\(\n\s\+-\{3,60\}\([^-]\|\n\|\s\)\)\@=/ contains=@Section

syn cluster Section contains=notesBold,notesItalic

" Highlight page breaks (characterized by 61 or more = or -)
syn match notesBreak /^=\{61,\}/
syn match notesBreak /\s\+=\{61,\}/
syn match notesBreak /^-\{61,\}/
syn match notesBreak /\s\+-\{61,\}/

" Highlight strings
syn region notesString start=/"/ skip=/\\\\\|\\"/ end=/"/ 
"syn region notesString start=/'/ skip=/\\\\\|\\'/ end=/'/

" Highlight keyword (within `s)
syn region notesKey start=/`/ skip=/\\\\\|\\`/ end=/`/ oneline

" Bold and Italic
syn match notesItalic / _[^_ 	]\+_/ms=s+2,me=e-1
syn match notesBold / \*[^* 	]*\*/ms=s+2,me=e-1

" A synchronisation guideline 
" For basic synching
syntax sync minlines=40 maxlines=500


let s:cpo_save = &cpo
set cpo&vim

syn case ignore

" GUI options
set wrap formatoptions+=t textwidth=80

" The keywords listed here will be highlighted -- add your own
syn keyword todoTodo        contained TODO FIXME DONE PITIVI UPLA EPSI 
" TODO: make this a user-defined global: g:TodoKeywords='foo,bar,baz'
syn keyword todoImportant   Pitivi Ask Hint help unittest core gui IA Metodologia Sociologia devel Proyecto estudiar definition ui
syn keyword todoImportant   contained Pitivi Ask Hint help unittest core IA Metodologia Sociologia devel Proyecto estudiar definition ui
syn keyword todoAlias       Padres Chargers Burritos
syn keyword todoAlias       contained Padres Chargers Burritos


"syn match   todoNodeProperty    '!\%(![^\\^%     ]\+\|[^!][^:/   ]*\)'
" syn match   todoAnchor          '&.\+'
" syn match   todoAlias           '\*.\+'
" Makes it dark yellow/gold, e.g. keyword or match here


" Removed todoComment block
" Erase any other errata found
syn match   todoDelimiter       '[-,:]'
syn match   todoBlock           '[\[\]{}>|]'
syn match   todoOperator        '[¿?+-]'
syn match   todoKey             '\w\+\(\s\+\w\+\)*\ze\s*:'
" Lines ending in ':'
syn match   todoKey             '^.*:\s*$'
                                \ contains=todoTodo,todoAlias,todoNumber,@Spell

syn match   todoEscape          contained display +\\[\\"abefnrtv^0_ NLP]+
syn match   todoEscape          contained display '\\x\x\{2}'
syn match   todoEscape          contained display '\\u\x\{4}'
syn match   todoEscape          contained display '\\U\x\{8}'
syn match   todoEscape          display '\\\%(\r\n\|[\r\n]\)'
syn match   todoSingleEscape    contained display +''+

syn match   todoNumber          display '\<[+-]\=\d\+\%(\.\d\+\%([eE][+-]\=\d\+\)\=\)\='
syn match   todoNumber          display '0\o\+'
syn match   todoNumber          display '0x\x\+'
syn match   todoNumber          display '([+-]\=[iI]nf)'
syn match   todoNumber          display '(NaN)'

syn match   todoConstant        '\<[~yn]\>'
syn keyword todoConstant        true True TRUE false False FALSE
syn keyword todoConstant        yes Yes no No
syn keyword todoConstant        null Null NULL nil Nil NIL

syn match   todoTimestamp       '\d\d\d\d-\%(1[0-2]\|\d\)-\%(3[0-2]\|2\d\|1\d\|\d\)\%( \%([01]\d\|2[0-3]\):[0-5]\d:[0-5]\d.\d\d [+-]\%([01]\d\|2[0-3]\):[0-5]\d\|t\%([01]\d\|2[0-3]\):[0-5]\d:[0-5]\d.\d\d[+-]\%([01]\d\|2[0-3]\):[0-5]\d\|T\%([01]\d\|2[0-3]\):[0-5]\d:[0-5]\d.\dZ\)\='

" Lines starting with '*'
syn match   todoComment         '^\s*[*].*$'
                                \ contains=todoTodo,todoAlias,todoNumber,@Spell

" From '{' to the end of the line
syn match   todoSectionHeader   '{.*$'
syn match   todoDirective       contained '%[^:]\+:.\+'

" Highlighting and Linking :
hi def link todoTodo            Todo
hi def link todoComment         Comment
hi def link todoSectionHeader   PreProc
hi def link todoDirective       Keyword
hi def link todoNodeProperty    Type
hi def link todoAnchor          Type
hi def link todoAlias           Type
hi def link todoDelimiter       Delimiter
hi def link todoBlock           Operator
hi def link todoOperator        Operator
hi def link todoKey             Identifier
hi def link todoString          String
hi def link todoEscape          SpecialChar
hi def link todoSingleEscape    SpecialChar
hi def link todoNumber          Number
hi def link todoConstant        Constant
hi def link todoImportant       Operator
hi def link todoTimestamp       Number
hi def link notesTodo Todo
hi def link notesTitle Conditional
hi def link notesAuthor Conditional
hi def link notesTitleBody Function
hi def link notesAuthorBody Function
hi def link notesComment Function
hi def link notesHighlitLine Function
hi def link notesImply Comment
hi def link notesBullet Function
highlight link notesSection Type
highlight link notesSubsection Preproc
hi def link notesBreak Constant
hi def link notesString String
hi def link notesKey SpecialChar
hi  notesItalic gui=italic term=italic cterm=italic
hi  notesBold gui=bold term=bold cterm=bold

let b:current_syntax = "todolist"

let &cpo = s:cpo_save
unlet s:cpo_save
let b:current_syntax = "notes"

