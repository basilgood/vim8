scriptencoding utf-8

Plugin 'mhinz/vim-signify'
Plugin 'junegunn/gv.vim'
Plugin 'hotwatermorning/auto-git-diff'
Plugin 'tpope/vim-fugitive'
nnoremap [fugitive]  <Nop>
nmap <space>g [fugitive]
nnoremap <silent> [fugitive]s :<C-u>Gstatus<CR>
nnoremap <silent> [fugitive]c :<C-u>Gcommit<CR>
nnoremap <silent> [fugitive]C :<C-u>Gcommit --amend<CR>
nnoremap <silent> [fugitive]a :<C-u>Dispatch! git add %<CR>
nnoremap <silent> [fugitive]r :<C-u>Dispatch! git reset %<CR>
nnoremap <silent> [fugitive]D :<C-u>Dispatch! git checkout -- %<CR>
nnoremap <silent> [fugitive]p :<C-u>Dispatch! git push<CR>
nnoremap <silent> [fugitive]P :<C-u>Dispatch! git push -f<CR>
nnoremap <silent> [fugitive]d :<C-u>Gvdiffsplit<CR>
nnoremap <silent> [fugitive]l :<C-u>GV --all<CR>


function! InFugitive() abort
  nmap <buffer> zp :<c-u>Dispatch! git push<CR>
  nmap <buffer> zf :<c-u>Dispatch! git push -f<CR>
endfunction

autocmd VGroup FileType fugitive call InFugitive()

function! s:enable_git_plugins() abort
  if system('git rev-parse --is-inside-work-tree') =~# '\m\C^true'
    call vivid#enable('vim-fugitive', 'vim-signify', 'gv.vim', 'auto-git-diff)')
    autocmd VGroup FocusGained,FocusLost,CursorHold * SignifyRefresh | SignifyEnable
  endif
endfunction
autocmd! VGroup BufReadPre * call s:enable_git_plugins()
