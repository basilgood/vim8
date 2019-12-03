scriptencoding utf-8

nnoremap [git]  <Nop>
nmap <space>g [git]
nnoremap <silent> [git]s :<C-u>vertical Gstatus<CR>
nnoremap <silent> [git]d :<C-u>Gvdiffsplit!<CR>
nnoremap <silent> [git]l :<C-u>GV --all<CR>

function! InFugitive() abort
  nmap <buffer> zp :<c-u>Dispatch! git push<CR>
  nmap <buffer> zF :<c-u>Dispatch! git push -f<CR>
endfunction

autocmd vimRc FileType fugitive call InFugitive()
