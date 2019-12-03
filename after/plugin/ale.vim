scriptencoding utf-8

"""" ale
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
let g:ale_sign_info = '_i'
let g:ale_sign_error = '_e'
let g:ale_sign_warning = '_w'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 0
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_code_actions_enabled = 1
let g:ale_set_balloons = 1
nnoremap gd :ALEGoToDefinition<CR>
nnoremap gD :ALEFindReferences -relative<CR>
nnoremap K :ALEHover<CR>
nnoremap <F2> :ALERename<CR>
nnoremap [a :ALEPreviousWrap<CR>
nnoremap ]a :ALENextWrap<CR>
let g:ale_html_languageserver_executable = '/etc/profiles/per-user/vasy/bin/html-languageserver'
let g:ale_fixers = {
  \   'javascript': ['eslint'],
  \   'html': ['eslint'],
  \   'yaml': ['prettier']
\}

let g:ale_linters = {
  \   'javascript': ['eslint', 'tsserver'],
  \   'vim': ['vint'],
  \   'html': ['html-languageserver'],
  \   'yaml': ['yamllint'],
\}
