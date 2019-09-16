if exists('b:current_syntax')
 finish
endif

syntax match qfDirectory '^[^|]*' nextgroup=qfSeparator
syntax match qfFileName '[^/|]\+\ze|' contained containedin=qfDirectory
syntax match qfSeparator '|' nextgroup=qfLineNr contained
syntax match qfLineNr '[^|]*' contained contains=qfError
syntax match qfError 'error' contained

highlight default link qfDirectory Identifier
highlight default link qfFileName PreProc
highlight default link qfLineNr LineNr
highlight default link qfError Error
highlight default link PathIgnore qfDirectory

setlocal conceallevel=0 nowrap

let b:current_syntax = 'qf'
