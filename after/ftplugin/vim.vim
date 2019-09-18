" Filename: ftplugin/vim.vim

let s:save_cpo = &cpo
set cpo&vim

setlocal foldmethod=marker
cnoremap <buffer><expr> <C-r><C-w> <SID>word()
function! s:word()
  let m = "\<C-r>\<C-w>"
  let s = synIDattr(synID(line('.'), col('.'), 0), 'name')
  return s ==# 'vimOption' ? "'".m."'" : s =~# 'vim\%(Command\|Map\>\|Let\|AugroupKey\|AutoCmd\>\|FTCmd\|NotFunc\)' ? ':'.m : s =~# 'vimFuncName' ? m.'()' : m
endfunction
if bufname('%') ==# '[Command Line]'
  setlocal nowrap
endif

let &cpo = s:save_cpo
unlet s:save_cpo
