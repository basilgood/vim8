scriptencoding utf-8

if !exists('g:loaded_ale')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('ale')}, {'repeat': 0})
endif

let g:ale_linters_explicit = 1
let g:ale_set_highlights = 0
let g:ale_sign_info = 'i'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_pattern_options_enabled = 1
let g:ale_pattern_options = {
      \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
      \ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
      \ 'node_modules/': { 'ale_enabled': 0 },
      \}
let g:ale_fix_on_save = 1
let g:ale_sign_warning = '᰽'
let g:ale_sign_error = '᰾'

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
      \ 'html': ['elsint']
      \}
nmap ]a <Plug>(ale_next_wrap)
nmap [a <Plug>(ale_previous_wrap)

