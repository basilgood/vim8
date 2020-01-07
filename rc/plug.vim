scriptencoding utf-8

function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('tpope/vim-vinegar', {'type': 'opt'})

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
  call minpac#add('ctrlpvim/ctrlp.vim', {'type': 'opt'})
  call minpac#add('sgur/vim-editorconfig', {'type': 'opt'})
  call minpac#add('tpope/vim-fugitive', {'type': 'opt'})
  call minpac#add('airblade/vim-gitgutter', {'type': 'opt'})
  call minpac#add('stefandtw/quickfix-reflector.vim', {'type': 'opt'})
  call minpac#add('hauleth/asyncdo.vim', {'type': 'opt'})
  call minpac#add('tomtom/tcomment_vim', {'type': 'opt'})
  call minpac#add('tpope/vim-surround', {'type': 'opt'})
  call minpac#add('tpope/vim-repeat')
  call minpac#add('fcpg/vim-altscreen')
  call minpac#add('markonm/traces.vim', {'type': 'opt'})
  call minpac#add('junegunn/vim-easy-align', {'type': 'opt'})
  call minpac#add('markonm/hlyank.vim', {'type': 'opt'})
  call minpac#add('wellle/targets.vim', {'type': 'opt'})
  call minpac#add('samoshkin/vim-mergetool', {'type': 'opt'})
  call minpac#add('da-x/conflict-marker.vim', {'type': 'opt'})
  call minpac#add('hotwatermorning/auto-git-diff', {'type': 'opt'})
  call minpac#add('jonsmithers/vim-html-template-literals', {'type': 'opt'})
  call minpac#add('LnL7/vim-nix', {'type': 'opt'})
  call minpac#add('evanleck/vim-svelte', {'type': 'opt'})
  call minpac#add('kchmck/vim-coffee-script', {'type': 'opt'})
  call minpac#add('plasticboy/vim-markdown', {'type': 'opt'})
  call minpac#add('lumiliet/vim-twig', {'type': 'opt'})
  call minpac#add('lepture/vim-jinja', {'type': 'opt'})
  call minpac#add('yuezk/vim-js', {'type': 'opt'})
  call minpac#add('MaxMEllon/vim-jsx-pretty', {'type': 'opt'})
  call minpac#add('HerringtonDarkholme/yats.vim', {'type': 'opt'})


endfunction
command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()
command! PackInstall call functions#installplug()
