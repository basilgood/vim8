scriptencoding utf-8

if !exists('g:loaded_quickrun')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('vim-quickrun')}, {'repeat': 0})
endif

let g:quickrun_config = {
      \'_': {
      \'runner': 'job',
      \'outputter' : 'error',
      \'outputter/error/success' : 'buffer',
      \'outputter/error/error'   : 'quickfix',
      \'outputter/quickfix/open_cmd' : 'copen',
      \'outputter/buffer/split' : ':botright 8sp',
      \'outputter/buffer/close_on_empty': 1,
      \'hook/quickfix_status_enable/enable_exit' : 1,
      \'hook/quickfix_replace_tempname_to_bufnr/enable' : 1,
      \'hook/quickfix_replace_tempname_to_bufnr/enable_exit' : 1,
      \'hook/quickfix_replace_tempname_to_bufnr/priority_exit' : -10,
      \},
      \}
