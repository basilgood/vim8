scriptencoding utf-8

" clone packager
if has('vim_starting')
  if !isdirectory(expand('~/.vim/pack/packager/opt/vim-packager/'))
    echo 'install packager...'
    call system('git clone https://github.com/kristijanhusak/vim-packager ~/.vim/pack/packager/opt/vim-packager')
  endif
endif

function! s:packager_init() abort
  packadd vim-packager
  call packager#init()
  call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })
  call packager#add('tpope/vim-vinegar', {'type': 'opt'})
  call packager#add('prabirshrestha/asyncomplete.vim')
  call packager#add('prabirshrestha/async.vim')
  call packager#add('prabirshrestha/vim-lsp')
  call packager#add('prabirshrestha/asyncomplete-lsp.vim')
  call packager#add('dense-analysis/ale', {'type': 'opt'})
  call packager#add('airblade/vim-gitgutter', {'type': 'opt'})
  call packager#add('Yggdroot/LeaderF', {'type': 'opt'})
  call packager#add('sgur/vim-editorconfig', {'type': 'opt'})
  call packager#add('tpope/vim-fugitive', {'type': 'opt'})
  call packager#add('airblade/vim-gitgutter', {'type': 'opt'})
  call packager#add('stefandtw/quickfix-reflector.vim')
  call packager#add('tpope/vim-dispatch', {'type': 'opt'})
  call packager#add('tomtom/tcomment_vim', {'type': 'opt'})
  call packager#add('tpope/vim-surround', {'type': 'opt'})
  call packager#add('tpope/vim-repeat')
  call packager#add('fcpg/vim-altscreen')
  call packager#add('markonm/traces.vim', {'type': 'opt'})
  call packager#add('junegunn/vim-easy-align', {'type': 'opt'})
  call packager#add('markonm/hlyank.vim', {'type': 'opt'})
  call packager#add('wellle/targets.vim', {'type': 'opt'})
  call packager#add('samoshkin/vim-mergetool', {'type': 'opt'})
  call packager#add('da-x/conflict-marker.vim', {'type': 'opt'})
  call packager#add('hotwatermorning/auto-git-diff', {'type': 'opt'})
  call packager#add('jonsmithers/vim-html-template-literals', {'branch': 'dev'})
  call packager#add('rhysd/vim-fixjson')
  call packager#add('LnL7/vim-nix', {'type': 'opt'})
  call packager#add('evanleck/vim-svelte', {'type': 'opt'})
  call packager#add('kchmck/vim-coffee-script', {'type': 'opt'})
  call packager#add('plasticboy/vim-markdown', {'type': 'opt'})
  call packager#add('lumiliet/vim-twig', {'type': 'opt'})
  call packager#add('lepture/vim-jinja', {'type': 'opt'})
  call packager#add('jonsmithers/vim-html-template-literals', {'branch': 'dev'})
  call packager#add('neoclide/vim-jsx-improve', {'type': 'opt'})
  call packager#add('HerringtonDarkholme/yats.vim', {'type': 'opt'})
endfunction



command! -nargs=0 PackagerInstall call s:packager_init() | call packager#install()
command! -bang PackagerUpdate call s:packager_init() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call s:packager_init() | call packager#clean()
command! PackagerStatus call s:packager_init() | call packager#status()
