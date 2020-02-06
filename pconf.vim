scriptencoding utf-8

if dein#tap('coc.nvim')
  nmap <silent> gld <Plug>(coc-definition)
  nmap <silent> gli <Plug>(coc-implementation)
  nmap <silent> glr <Plug>(coc-references)
  nmap <silent> glc <Plug>(coc-codeaction)
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)
  nmap <silent> [c <Plug>(coc-git-prevchunk)
  nmap <silent> ]c <Plug>(coc-git-nextchunk)
  nnoremap <silent> K :call CocAction('doHover')<cr>
  command! -nargs=0 Format :call CocAction('format')
  command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
endif

if dein#tap('fzf.vim')
  let $FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  let g:fzf_layout = { 'down': '~25%' }
  let g:fzf_action = {
        \ 'ctrl-t': 'tab split',
        \ 'ctrl-s': 'split',
        \ 'ctrl-v': 'vsplit',
        \ 'ctrl-w': 'bdelete'}
  nnoremap <c-p> :Files<cr>
  nnoremap <c-h> :Files %:h<cr>
  nnoremap <bs> :Buffers<cr>
endif

if dein#tap('vim-vinegar')
  let g:netrw_bufsettings = 'nomodifiable nomodified relativenumber nowrap readonly nobuflisted'
  let g:netrw_altfile             = 1
  let g:netrw_home='~/.cache/vim/cache/'
  autocmd vimRc FileType netrw call functions#innetrw()
endif

if dein#tap('vim-surround')
  let g:surround_no_insert_mappings = 1
  let surround_indent = 1
  nmap S ysiw
endif

if dein#tap('vim-editorconfig')
  let g:editorconfig_root_chdir = 1
  let g:editorconfig_verbose    = 1
  let g:editorconfig_blacklist  = {
        \ 'filetype': ['git.*', 'fugitive'],
        \ 'pattern': ['\.un~$']}
endif

if dein#tap('vim-fugitive')
  nnoremap [git]  <Nop>
  nmap <space>g [git]
  nnoremap <silent> [git]s :<C-u>vertical Gstatus<CR>
  nnoremap <silent> [git]d :<C-u>Gvdiffsplit!<CR>

  function! InFugitive() abort
    nmap <buffer> zp :<c-u>Dispatch! git push<CR>
    nmap <buffer> zF :<c-u>Dispatch! git push -f<CR>
  endfunction

  autocmd vimRc FileType fugitive call InFugitive()
endif

if dein#tap('vim-easy-align')
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
endif

if dein#tap('undotree')
  let g:undotree_CustomUndotreeCmd = 'vertical 50 new'
  let g:undotree_CustomDiffpanelCmd= 'belowright 12 new'
  let g:undotree_SetFocusWhenToggle = 1
  let g:undotree_ShortIndicators = 1
endif

if dein#tap('SimpleAutoComplPop')
  autocmd vimRc FileType pug call sacp#enableForThisBuffer({ "matches": [
        \ { '=~': '\v[a-zA-Z]{1}$' , 'feedkeys': "\<C-x>\<C-o>"} ,
        \ { '=~': '\.$'            , 'feedkeys': "\<C-x>\<C-n>"} ,
        \ ]
        \ })
  autocmd vimRc FileType nix call sacp#enableForThisBuffer({ "matches": [
        \ { '=~': '\v[a-zA-Z]{2}$' , 'feedkeys': "\<C-x>\<C-n>"} ,
        \ { '=~': '\.$'            , 'feedkeys': "\<C-x>\<C-n>"} ,
        \ ]
        \ })
  autocmd vimRc FileType scss,css call sacp#enableForThisBuffer({ "matches": [
        \ { '=~': '\v[a-zA-Z]{2}$' , 'feedkeys': "\<C-x>\<C-o>"} ,
        \ { '=~': '\.$'            , 'feedkeys': "\<C-x>\<C-o>"} ,
        \ { '=~': '\: $'           , 'feedkeys': "\<C-x>\<C-o>"} ,
        \ ]
        \ })
endif
