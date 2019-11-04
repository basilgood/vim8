let b:ale_linters = ['htmlide']

function! ale_linters#html#htmlide#GetProjectRoot(buffer) abort
	" Get the name of the buffer,
	" make it a full path (:p),
	" and remove the last component (:h)
	return fnamemodify(bufname(a:buffer), ':p:h')
endfunction
call ale#linter#Define('hmtl', {
  \ 'name':       'html-languageserver',
  \ 'lsp':        'stdio',
\   'executable': {b -> ale#node#FindExecutable(b, 'html-languageserver', [
\       'node_modules/.bin/html-languageserver',
\   ])},
  \ 'command':    '--stdio',
  \	'project_root': 'ale_linters#html#htmlide#GetProjectRoot',
\ })
