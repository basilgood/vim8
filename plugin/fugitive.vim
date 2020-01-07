scriptencoding utf-8

nnoremap [git]  <Nop>
nmap <space>g [git]
nnoremap <silent> [git]s :<C-u>vertical Gstatus<CR>
nnoremap <silent> [git]d :<C-u>Gvdiffsplit!<CR>

function! InFugitive() abort
  nmap <buffer> zp :<c-u>AsyncDo git push<CR>
  nmap <buffer> zF :<c-u>AsyncDo git push -f<CR>
  nmap <buffer> <c-l> :<c-u>call fugitive#ReloadStatus()<cr>
endfunction

autocmd vimRc FileType fugitive call InFugitive()
autocmd vimRc BufReadPre * packadd vim-fugitive
