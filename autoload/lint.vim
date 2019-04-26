scriptencoding utf-8

if !exists('g:loaded_ale')
  autocmd MyAutoCmd BufRead * packadd ale
endif

let g:ale_linters_explicit = 1
let g:ale_set_highlights = 0
let g:ale_sign_info = 'ℹ'
let g:ale_echo_msg_error_str='[ERROR]'
let g:ale_echo_msg_info_str='[INFO]'
let g:ale_echo_msg_warning_str='[WARNING]'
let g:ale_echo_msg_format = '%severity% %linter% %code% -> %s'
let g:ale_pattern_options_enabled = 1
let g:ale_pattern_options = {
      \   '\.min\.(js\|css)$': {
      \       'ale_linters': [],
      \       'ale_fixers': []
      \   },
      \   'jquery.*': {
      \       'ale_linters': [],
      \       'ale_fixers': []
      \   },
      \   'node_modules/.*': {
      \       'ale_linters': [],
      \       'ale_fixers': []
      \   },
      \   'package.json': {
      \       'ale_fixers': []
      \   },
      \}
let g:ale_fix_on_save = 1
let g:ale_sign_warning = '੦'
let g:ale_sign_error = '੦'

 let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'html': ['eslint']
      \}

 let g:ale_linter_aliases = {
      \ 'html': 'javascript'
      \}

 let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'yaml': ['yamllint'],
      \ 'vim': ['vint'],
      \ 'nix': ['nix'],
      \ 'html': ['eslint']
      \}
nmap ]a <Plug>(ale_next_wrap)
nmap [a <Plug>(ale_previous_wrap)

function! lint#linter()
endfunction
