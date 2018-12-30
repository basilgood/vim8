scriptencoding utf-8

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
let g:ack_use_dispatch=1
let g:ackhighlight = 1
let g:ack_mappings = { 'o': '<CR>zz' }
