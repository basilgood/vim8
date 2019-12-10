scriptencoding utf-8

" cohama
function! SuperRuler(count)
  let cnt = (a:count == 0) ? '' : a:count
  redir => ruler_out
    silent execute 'silent normal! ' . cnt . "\<C-g>"
  redir END
  let super_ruler = ruler_out[2:] . '    | ' . &fileformat . ' | ' . &fileencoding . ' | ' . &filetype . ' | ' . VCSRepoInfo()
  echo super_ruler
endfunction

function! VCSRepoInfo() abort
  packadd vim-fugitive
  doautocmd fugitive BufReadPost
  return fugitive#head()
endfunction
nnoremap <C-G> :<C-u>call SuperRuler(v:count)<CR>
