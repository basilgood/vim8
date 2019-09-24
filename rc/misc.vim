scriptencoding utf-8

" submode.
function! SubMode()
  call submode#enter_with('resize', 'n', '', '<C-W>>', '<C-W>>')
  call submode#enter_with('resize', 'n', '', '<C-W><', '<C-W><')
  call submode#map('resize', 'n', '', '.', '<C-W>>')
  call submode#map('resize', 'n', '', ',', '<C-W><')
  call submode#enter_with('resize', 'n', '', '<C-W>-', '<C-W>-')
  call submode#enter_with('resize', 'n', '', '<C-W>+', '<C-W>+')
  call submode#map('resize', 'n', '', '-', '<C-W>-')
  call submode#map('resize', 'n', '', '=', '<C-W>+')
  call submode#leave_with('resize', 'n', '', '<Esc>')
  call submode#enter_with('scroll-h', 'n', '', 'zl', 'zl')
  call submode#enter_with('scroll-h', 'n', '', 'zh', 'zh')
  call submode#enter_with('scroll-h', 'n', '', 'zL', 'zL')
  call submode#enter_with('scroll-h', 'n', '', 'zH', 'zH')
  call submode#map('scroll-h', 'n', '', 'l', 'zl')
  call submode#map('scroll-h', 'n', '', 'h', 'zh')
  call submode#map('scroll-h', 'n', '', 'L', 'zL')
  call submode#map('scroll-h', 'n', '', 'H', 'zH')
endfunction
autocmd vimRc BufReadPre * packadd vim-submode | call SubMode()

" startify
let g:startify_files_number           = 18
let g:startify_session_persistence    = 1
let g:startify_session_dir = '~/.cache/vim/session'
let g:startify_change_to_dir = 0

if !exists('g:startify_bookmarks')
  let g:startify_bookmarks = []
endif

let g:startify_lists = [
  \ { 'type': 'dir',       'header': ['   Recent files'] },
  \ { 'type': 'sessions',  'header': ['   Saved sessions'] },
  \ ]

if $MINIMAL_PROMPT != ''
  let g:startify_custom_header = [ '' ]
else
  let g:startify_custom_header = [
    \ "  ",
    \ '   ╻ ╻   ╻   ┏┳┓',
    \ '   ┃┏┛   ┃   ┃┃┃',
    \ '   ┗┛    ╹   ╹ ╹',
    \ '   ',
    \ ]
endif
