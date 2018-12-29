let g:neocomplete#enable_at_startup = 1
let g:neocomplete#disable_auto_complete=1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#enable_camel_case_completion  =  1
let g:neocomplete#keyword_patterns          = {'_': '\h\w*'}
let g:neocomplete#sources#buffer#cache_limit_size  = 50000

let g:neocomplete#sources#dictionary#dictionaries  = {
\    '_':          '',
\    'css':        $HOME . '/.vim/dict/css.dict',
\    'html':       $HOME . '/.vim/dict/html.dict',
\    'javascript': $HOME . '/.vim/dict/javascript.dict',
\    'vim':        $HOME . '/.vim/dict/vim.dict',
\    "php":        $HOME . '/.vim/dict/php.dict'
\}

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ neocomplete#start_manual_complete()

function! s:check_back_space()
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
