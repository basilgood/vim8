augroup quick
  autocmd!
autocmd FileType qf call AdjustWindowHeight(2, 8)
augroup End
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line('$'), a:maxheight]), a:minheight]) . 'wincmd _'
endfunction
