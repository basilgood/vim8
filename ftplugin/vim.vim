scriptencoding utf-8

setlocal expandtab

setlocal formatoptions=croql
" Continue \ lines after one is found.
setlocal comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",b:\\

autocmd VGroup BufWrite * :Autoformat
