scriptencoding utf-8

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
