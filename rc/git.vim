scriptencoding utf-8

" git.
call add(g:plugins.opt, $GITHUB_COM.'tpope/vim-fugitive')
nnoremap [fugitive]  <Nop>
nmap <space>g [fugitive]
nnoremap <silent> [fugitive]s :<C-u>vertical Gstatus<CR>
nnoremap <silent> [fugitive]d :<C-u>Gvdiffsplit<CR>
nnoremap <silent> [fugitive]l :<C-u>Gitv --all<CR>
nnoremap <silent> [fugitive]m :<C-u>Twiggy<CR>

function! InFugitive() abort
  nmap <buffer> zp :<c-u>Dispatch! git push<CR>
  nmap <buffer> zF :<c-u>Dispatch! git push -f<CR>
  nmap <buffer> zf :<c-u>Dispatch! git fetch --all --prune<CR>
  nmap <buffer> zr :<c-u>Dispatch! git pull --rebase --autostash<CR>
endfunction

autocmd vimRc FileType fugitive call InFugitive()

call add(g:plugins.opt, $GITHUB_COM.'mhinz/vim-signify')
nnoremap [Space]v :SignifyDiffPreview<cr>

call add(g:plugins.opt, $GITHUB_COM.'junegunn/gv.vim')
call add(g:plugins.opt, $GITHUB_COM.'Tiancheng-Luo/conflict3')
call add(g:plugins.opt, $GITHUB_COM.'hotwatermorning/auto-git-diff')
call add(g:plugins.opt, $GITHUB_COM.'tonchis/vim-to-github')
call add(g:plugins.opt, $GITHUB_COM.'wincent/vcs-jump')
call add(g:plugins.opt, $GITHUB_COM.'sodapopcan/vim-twiggy')
