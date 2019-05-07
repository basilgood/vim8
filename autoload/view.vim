scriptencoding utf-8

function! view#check()
  if &l:diff | return 0 | endif
  if &buftype != '' | return 0 | endif
  if expand('%') =~ '\[.*\]' | return 0 | endif
  if empty(glob(expand('%:p'))) | return 0 | endif
  if &modifiable == 0 | return 0 | endif
  if len($TEMP) && expand('%:p:h') == $TEMP | return 0 | endif
  if len($TMP) && expand('%:p:h') == $TMP | return 0 | endif

  let file_name = expand('%:p')
endfunction
