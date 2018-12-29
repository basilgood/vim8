let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
if executable('fd')
  let g:ctrlp_user_command = 'fd --type f --color never "" %s'
  let g:ctrlp_use_caching = 0
endif
" let g:ctrlp_max_files = 10000
" let g:ctrlp_by_filename = 1

" if has('unix')
"   let g:ctrlp_user_command = {
"         \   'types': {
"         \       1: ['.git/', 'cd %s && git ls-files']
"         \   },
"         \   'fallback': 'find %s -type f | head -' . g:ctrlp_max_files
"         \ }
" endif
