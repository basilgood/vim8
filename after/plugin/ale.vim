let g:ale_linters_explicit = 1
let g:ale_set_highlights = 0
let g:ale_sign_info = 'i'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_pattern_options_enabled = 1
let g:ale_pattern_options = {
      \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
      \ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
      \}
let g:ale_fix_on_save = 1
let g:ale_sign_error = '⬥ '
let g:ale_sign_warning = '⬥ '
highlight ALEWarningSign guibg=#282c34 guifg=DarkYellow
highlight ALEErrorSign guibg=#282c34 guifg=DarkMagenta

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
nmap <silent> <leader>j <Plug>(ale_previous_wrap)
nmap <silent> <leader>k <Plug>(ale_next_wrap)
