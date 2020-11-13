setlocal suffixesadd+=.js,.jsx,.json

setlocal isfname+=@-@
" let &l:include = 'from\|require'
" let &l:define = '\v(export\s+(default\s+)?)?(var|let|const|(async\s+)?function|class)|export\s+'

set wildignore=**/node_modules/**,**/dist/**

" nnoremap gp m`:silent keepjump  %!prettier --stdin --trailing-comma all --single-quote --stdin-filepath %<CR>``
let s:snippets_map={
      \ 'cl': 'console.log()<left>',
      \ '(': '() => {}<left>',
      \ '=': '=> {}<left>',
      \ 'bd': 'browser.debug();',
      \ 'bp': 'browser.pause();<left><left>',
      \ 'ou': '.outline();',
      \ 'sh': '.shadow$(',
      \ }
for [s:pattern, s:expansion] in items(s:snippets_map)
  execute 'ISnipletBuffer' s:pattern s:expansion
endfor
