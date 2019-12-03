scriptencoding utf-8

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_use_caching = 0
let g:ctrlp_show_hidden = 1
nnoremap <bs> :CtrlPBuffer<cr>
nnoremap <C-t> :CtrlPCurFile<cr>
if executable('fd')
  let g:ctrlp_user_command = 'fd --color=never --hidden --follow --exclude .git --exclude pack --type file . %s'
endif
let g:ctrlp_extensions = ['commandline', 'menu']

let g:fruzzy#usenative = 1
let g:ctrlp_match_func = {'match': 'fruzzy#ctrlp#matcher'}
let g:ctrlp_match_current_file = 1
