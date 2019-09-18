" Filename: ftplugin/qf.vim

let s:save_cpo = &cpo
set cpo&vim

setlocal nocursorline
nnoremap <buffer><silent> q     :<C-u>try<bar>wincmd p<bar>cclose<bar>lclose<bar>catch<bar>enew<bar>endtry<CR>
nnoremap <buffer><silent> <C-t> :<C-u>call <SID>qfenter('tabnew')<CR>
nnoremap <buffer><silent> <C-n> :<C-u>call <SID>qfenter('wincmd p <bar> new')<CR>
nnoremap <buffer><silent> <C-v> :<C-u>call <SID>qfenter('wincmd p <bar> vnew')<CR>
nnoremap <buffer><silent> <C-h> :<C-u>call <SID>qfenter('wincmd p <bar> wincmd h')<CR>
nnoremap <buffer><silent> <C-l> :<C-u>call <SID>qfenter('wincmd p <bar> wincmd l')<CR>
function! s:qfenter(cmd)
  let lnum = line('.')
  let cmd = get(get(getwininfo(win_getid()), 0, {}), 'loclist', 0) ? 'll' : 'cc'
  silent! execute a:cmd
  silent! execute cmd lnum
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
