scriptencoding utf-8

let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1

if !exists('g:loaded_undotree')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> functions#plug('undotree')}, {'repeat': 0})
endif
