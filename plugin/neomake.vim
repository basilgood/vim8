scriptencoding utf-8

let g:neomake_highlight_columns = 0
autocmd vimRc FileType *
      \ call neomake#configure#automake_for_buffer('rnw', 500)
let g:neomake_error_sign = {
      \ 'text': '_e',
      \ 'texthl': 'GitGutterDelete',
      \ }
let g:neomake_warning_sign = {
      \   'text': '_w',
      \   'texthl': 'GitGutterChange',
      \ }
let g:neomake_message_sign = {
      \   'text': '➤',
      \   'texthl': 'NeomakeMessageSign',
      \ }
let g:neomake_info_sign = {
      \ 'text': 'ℹ',
      \ 'texthl': 'NeomakeInfoSign'
      \ }
