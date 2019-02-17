scriptencoding utf-8

function! InlinePaste(p)
  let l:original_reg = getreg(v:register)
  let l:stripped_reg = substitute(l:original_reg, '\v^%(\n|\s)*(.{-})%(\n|\s)*$', '\1', '')
  call setreg(v:register, l:stripped_reg, 'c')
  exe 'normal "' . v:register . a:p
  call setreg(v:register, l:original_reg)
endfunction
nnoremap <silent> zp :<c-u>call InlinePaste('p')<cr>
nnoremap <silent> zP :<c-u>call InlinePaste('P')<cr>
