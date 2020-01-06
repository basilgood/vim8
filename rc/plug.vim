scriptencoding utf-8

try
  packadd minpac
catch
  fun! InstallPlug()
    exe '!git clone https://github.com/k-takata/minpac.git  ~/.vim/pack/minpac/opt/minpac'
  endfun
endtry
if exists('*minpac#init')

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('tpope/vim-vinegar', {'type': 'opt'})
  autocmd vimRc VimEnter * packadd vim-vinegar

  call minpac#add('natebosch/vim-lsc')
  call minpac#add('roxma/SimpleAutoComplPop')
  autocmd vimRc FileType nix call sacp#enableForThisBuffer({ "matches": [
        \ { '=~': '\v[a-zA-Z]{2}$', 'feedkeys': "\<Plug>(sacp_cache_fuzzy_bufferkeyword_complete)"},
        \ { '=~': '\v[a-zA-Z]{2}$', 'feedkeys': "\<C-x>\<C-o>"},
        \ { '=~': '\.$'           , 'feedkeys': "\<C-x>\<C-n>"},
        \ ]
        \ })
  autocmd vimRc FileType scss call sacp#enableForThisBuffer({ "matches": [
        \ { '=~': '\v[a-zA-Z]{2}$', 'feedkeys': "\<C-x>\<C-o>"},
        \ { '=~': '\.$'           , 'feedkeys': "\<C-x>\<C-n>"},
        \ { '=~': '\#$'           , 'feedkeys': "\<C-x>\<C-n>"},
        \ { '=~': '\: $'          , 'feedkeys': "\<C-x>\<C-o>"},
        \ ]
        \ })

  call minpac#add('neomake/neomake')
  let g:neomake_highlight_columns = 0
  autocmd vimRc FileType *
        \ call neomake#configure#automake_for_buffer('rnw', 500)
  let g:neomake_error_sign = {
        \ 'text': '_e',
        \ 'texthl': 'GitGutterDelete',
        \ }
  let g:neomake_warning_sign = {
        \   'text': '_w',
        \   'texthl': 'GitGutterChange',
        \ }
  let g:neomake_message_sign = {
        \   'text': '➤',
        \   'texthl': 'NeomakeMessageSign',
        \ }
  let g:neomake_info_sign = {
        \ 'text': 'ℹ',
        \ 'texthl': 'NeomakeInfoSign'
        \ }

  call minpac#add('ctrlpvim/ctrlp.vim', {'type': 'opt'})
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_show_hidden = 1
  let g:ctrlp_match_current_file = 1
  nnoremap <silent> <C-p> :packadd ctrlp.vim<cr>:CtrlP<cr>
  nnoremap <silent> <bs> :CtrlPBuffer<cr>
  nnoremap <silent> <C-t> :CtrlPCurFile<cr>

  if executable('fd')
    let g:ctrlp_user_command =
          \ 'fd --color=never --hidden --follow --exclude .git --exclude pack --type file . %s'
  endif

  call minpac#add('sgur/vim-editorconfig', {'type': 'opt'})
  let g:editorconfig_root_chdir = 1
  let g:editorconfig_verbose    = 1
  let g:editorconfig_blacklist  = {
        \ 'filetype': ['git.*', 'fugitive'],
        \ 'pattern': ['\.un~$']}
  autocmd vimRc BufReadPre * packadd vim-editorconfig

  call minpac#add('tpope/vim-fugitive', {'type': 'opt'})
  autocmd vimRc BufReadPre * packadd vim-fugitive
  nnoremap [git]  <Nop>
  nmap <space>g [git]
  nnoremap <silent> [git]s :<C-u>vertical Gstatus<CR>
  nnoremap <silent> [git]d :<C-u>Gvdiffsplit!<CR>
  function! InFugitive() abort
    nmap <buffer> zp :<c-u>Dispatch! git push<CR>
    nmap <buffer> zF :<c-u>Dispatch! git push -f<CR>
  endfunction
  autocmd vimRc FileType fugitive call InFugitive()

  call minpac#add('airblade/vim-gitgutter', {'type': 'opt'})
  autocmd vimRc VimEnter * packadd vim-gitgutter
  let g:gitgutter_preview_win_floating = 1
  let g:gitgutter_sign_priority = 8
  let g:gitgutter_override_sign_column_highlight = 0
  let g:gitgutter_sign_added              = '|'
  let g:gitgutter_sign_modified           = '|'
  nmap ghs <Plug>(GitGutterStageHunk)
  nmap ghu <Plug>(GitGutterUndoHunk)
  nmap ghp <Plug>(GitGutterPreviewHunk)

  call minpac#add('stefandtw/quickfix-reflector.vim', {'type': 'opt'})
  autocmd vimRc VimEnter * packadd quickfix-reflector.vim

  call minpac#add('tpope/vim-dispatch', {'type': 'opt'})
  autocmd vimRc VimEnter * packadd vim-dispatch

  call minpac#add('tomtom/tcomment_vim', {'type': 'opt'})
  autocmd vimRc BufReadPost * packadd tcomment_vim

  call minpac#add('tpope/vim-surround', {'type': 'opt'})
  let g:surround_no_insert_mappings = 1
  let surround_indent=1
  nmap S ysiw
  autocmd vimRc BufReadPost * packadd vim-surround

  call minpac#add('tpope/vim-repeat')
  call minpac#add('fcpg/vim-altscreen')

  call minpac#add('markonm/traces.vim', {'type': 'opt'})
  autocmd vimRc BufReadPost * packadd traces.vim

  call minpac#add('junegunn/vim-easy-align', {'type': 'opt'})
  nmap ga <Plug>(EasyAlign)
  xmap ga <Plug>(EasyAlign)
  autocmd vimRc BufReadPost * packadd vim-easy-align

  call minpac#add('markonm/hlyank.vim', {'type': 'opt'})
  autocmd vimRc BufReadPost * packadd hlyank.vim

  call minpac#add('wellle/targets.vim', {'type': 'opt'})
  autocmd vimRc BufReadPost * packadd targets.vim

  call minpac#add('samoshkin/vim-mergetool', {'type': 'opt'})
  let g:mergetool_layout = 'bmr'
  autocmd vimRc BufReadPost * packadd vim-mergetool

  call minpac#add('da-x/conflict-marker.vim', {'type': 'opt'})
  autocmd vimRc BufReadPost * packadd conflict-marker.vim

  call minpac#add('hotwatermorning/auto-git-diff', {'type': 'opt'})

  call minpac#add('jonsmithers/vim-html-template-literals', {'type': 'opt'})
  call minpac#add('LnL7/vim-nix', {'type': 'opt'})
  autocmd vimRc BufReadPre *.nix packadd vim-nix
  call minpac#add('evanleck/vim-svelte', {'type': 'opt'})
  call minpac#add('kchmck/vim-coffee-script', {'type': 'opt'})
  call minpac#add('plasticboy/vim-markdown', {'type': 'opt'})
  call minpac#add('lumiliet/vim-twig', {'type': 'opt'})
  call minpac#add('lepture/vim-jinja', {'type': 'opt'})
  call minpac#add('yuezk/vim-js', {'type': 'opt'})
  call minpac#add('MaxMEllon/vim-jsx-pretty', {'type': 'opt'})
  call minpac#add('HerringtonDarkholme/yats.vim', {'type': 'opt'})

endif
