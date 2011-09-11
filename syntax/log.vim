"yntax file
" file type: log files
 " Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
 finish
endif
syn match fatal "FATAL"
syn match error "ERROR"
syn match warn "WARN"
syn match info "INFO"
syn match deb "DEBUG"

"syn match   num          display '\<[+-]\=\d\+\%(\.\d\+\%([eE][+-]\=\d\+\)\=\)\='
"syn match   num          display '0\o\+'
"syn match   num          display '([+-]\=[iI]nf)'
"syn match   num          display '(NaN)'

syn match   fnName             '\g.*.c:.*:'
syn match   fnName             ':pi.*:'

syn match croch '<.*>'

syn match filename display 'gst.*\.c'
" Highlight colors for log levels.
"
hi def link fatal            Todo
hi def link error         Comment
hi def link warn   PreProc
hi def link info       Keyword
hi def link deb    Operator
hi def link num          Number
hi def link filename          Function
hi def link fnName          Function
hi def link croch          Delimiter

let b:current_syntax = "log"

" vim: ts=2 sw=2 =
