scriptencoding utf-8

let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_use_caching = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_current_file = 1

nnoremap <silent> <C-p> :packadd ctrlp.vim<cr>:CtrlP<cr>
nnoremap <silent> <bs> :CtrlPBuffer<cr>
nnoremap <silent> <C-t> :CtrlPCurFile<cr>

if executable('fd')
  let g:ctrlp_user_command =
        \ 'fd --color=never --hidden --follow --exclude .git --exclude pack --type file . %s'
endif

