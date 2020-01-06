scriptencoding utf-8

let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_priority = 8
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added              = '|'
let g:gitgutter_sign_modified           = '|'

nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

autocmd vimRc VimEnter * packadd vim-gitgutter
