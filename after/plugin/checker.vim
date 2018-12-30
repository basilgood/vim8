let g:quickrun_config = {
      \'_': {
      \'runner': 'job',
      \'outputter' : 'error',
      \'outputter/error/success' : 'buffer',
      \'outputter/error/error'   : 'quickfix',
      \'outputter/quickfix/open_cmd' : 'copen',
      \'outputter/buffer/split' : ':botright 8sp',
      \'hook/quickfix_status_enable/enable_exit' : 1,
      \'hook/quickfix_replace_tempname_to_bufnr/enable' : 1,
      \'hook/quickfix_replace_tempname_to_bufnr/enable_exit' : 1,
      \'hook/quickfix_replace_tempname_to_bufnr/priority_exit' : -10,
      \},
      \'watchdogs_checker/_' : {
      \'runner' : 'job',
      \},
      \'ruby/watchdogs_checker': {
      \'type': 'watchdogs_checker/ruby',
      \},
      \'watchdogs_checker/ruby' : {
      \'command' : 'ruby',
      \},
      \'yaml/watchdogs_checker': {
      \'type': 'watchdogs_checker/yaml-lint',
      \},
      \'watchdogs_checker/yaml-lint': {
      \'command': 'yamllint',
      \'errorformat' : '%f:%l:%c:%m,%f:%l:%m,%-G%.%#',
      \'cmdopt' : '-f parsable',
      \},
      \'javascript/watchdogs_checker': {
      \'type': 'watchdogs_checker/eslint',
      \},
      \'watchdogs_checker/eslint' : {
      \'command'   : './node_modules/.bin/eslint',
      \ }
      \}

let g:watchdogs_check_BufWritePost_enables = {
      \ 'javascript' : 1,
      \ 'vim' : 1,
      \ 'yaml' : 1,
      \ 'ruby' : 1
      \}

let g:watchdogs_check_CursorHold_enables = {
      \ 'javascript': 1,
      \ 'vim' : 1,
      \ 'yaml' : 1,
      \ 'ruby' : 1
      \}
