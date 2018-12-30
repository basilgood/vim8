let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
if executable('fd')
  let g:ctrlp_user_command = 'fd --type f --color never --hidden --exclude ".git" "" %s'
  let g:ctrlp_use_caching = 0
endif
