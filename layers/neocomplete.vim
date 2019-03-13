scriptencoding utf-8

if !exists('g:loaded_neocomplete')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> plug#plug('neocomplete.vim')}, {'repeat': 0})
endif
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#disable_auto_complete=1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ neocomplete#start_manual_complete()
function! s:check_back_space() "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction"}}}
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : neocomplete#start_manual_complete()
