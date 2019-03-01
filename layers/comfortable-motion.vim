scriptencoding utf-8

if !exists('g:loaded_comfortable_motion')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('comfortable-motion.vim')}, {'repeat': 0})
endif

noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>
