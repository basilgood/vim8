scriptencoding utf-8

" submode
call add(g:plugins.opt, $GITHUB_COM.'kana/vim-submode')
function! SubMode()
  call submode#enter_with('resize', 'n', '', '<C-W>>', '<C-W>>')
  call submode#enter_with('resize', 'n', '', '<C-W><', '<C-W><')
  call submode#map('resize', 'n', '', '.', '<C-W>>')
  call submode#map('resize', 'n', '', ',', '<C-W><')
  call submode#enter_with('resize', 'n', '', '<C-W>-', '<C-W>-')
  call submode#enter_with('resize', 'n', '', '<C-W>+', '<C-W>+')
  call submode#map('resize', 'n', '', '-', '<C-W>-')
  call submode#map('resize', 'n', '', '=', '<C-W>+')
  call submode#leave_with('resize', 'n', '', '<Esc>')
  call submode#enter_with('scroll-h', 'n', '', 'zl', 'zl')
  call submode#enter_with('scroll-h', 'n', '', 'zh', 'zh')
  call submode#enter_with('scroll-h', 'n', '', 'zL', 'zL')
  call submode#enter_with('scroll-h', 'n', '', 'zH', 'zH')
  call submode#map('scroll-h', 'n', '', 'l', 'zl')
  call submode#map('scroll-h', 'n', '', 'h', 'zh')
  call submode#map('scroll-h', 'n', '', 'L', 'zL')
  call submode#map('scroll-h', 'n', '', 'H', 'zH')
endfunction

" startify.
call add(g:plugins.start, $GITHUB_COM.'mhinz/vim-startify')
nnoremap <space>q :SC<cr>
let g:startify_files_number        = 5
let g:startify_change_to_dir       = 0
let g:startify_enable_special      = 0
let g:startify_update_oldfiles     = 1
let g:startify_session_dir         = '~/.cache/vim/session'
let g:startify_bookmarks = []
let g:startify_custom_header = []
let g:startify_lists = [
      \ { 'type': 'dir',       'header': ['   Recent files'] },
      \ { 'type': 'sessions',  'header': ['   Sessions'], 'indices': ['A','B','C'] },
      \ ]

function! s:save_session() abort
  if !empty(v:this_session) && get(g:, 'startify_session_persistence')
    call startify#session_write(v:this_session)
  endif
endfunction

autocmd BufNewFile,BufAdd,BufDelete,BufLeave * call s:save_session()

" enhancements.
call add(g:plugins.opt, $GITHUB_COM.'tpope/vim-dispatch')
call add(g:plugins.opt, $GITHUB_COM.'markonm/traces.vim')
call add(g:plugins.opt, $GITHUB_COM.'stefandtw/quickfix-reflector.vim')
call add(g:plugins.opt, $GITHUB_COM.'itchyny/vim-parenmatch')
call add(g:plugins.opt, $GITHUB_COM.'sgur/cmdline-completion')
call add(g:plugins.opt, $GITHUB_COM.'markonm/hlyank.vim')

" undotree.
call add(g:plugins.opt, $GITHUB_COM.'mbbill/undotree')
let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
nnoremap <leader>u :UndotreeToggle<cr>

" ferret, grep async
call add(g:plugins.opt, $GITHUB_COM.'wincent/ferret')

" bracketed paste
call add(g:plugins.opt, $GITHUB_COM.'ConradIrwin/vim-bracketed-paste')
call add(g:plugins.opt, $GITHUB_COM.'Shougo/echodoc.vim')
set cmdheight=2
let g:echodoc_enable_at_startup = 1

" completion
" call add(g:plugins.opt, $GITHUB_COM.'Shougo/neocomplete.vim')
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#sources#syntax#min_keyword_length = 3
" let g:neocomplcache_min_syntax_length = 1
" inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()

" call add(g:plugins.start, $GITHUB_COM.'prabirshrestha/async.vim')
" call add(g:plugins.opt, $GITHUB_COM.'prabirshrestha/asyncomplete.vim')
" let g:asyncomplete_remove_duplicates = 1
" let g:asyncomplete_smart_completion = 0
" inoremap <expr> <C-y> pumvisible() ? asyncomplete#close_popup() : "\<C-y>"
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" imap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

" call add(g:plugins.start, $GITHUB_COM.'prabirshrestha/asyncomplete-buffer.vim')
" au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
"       \ 'name': 'buffer',
"       \ 'whitelist': ['*'],
"       \ 'blacklist': [],
"       \ 'completor': function('asyncomplete#sources#buffer#completor'),
"       \ 'config': {
"       \    'max_buffer_size': 5000000,
"       \  },
"       \ }))

" call add(g:plugins.start, $GITHUB_COM.'yami-beta/asyncomplete-omni.vim')
" au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
"   \ 'name': 'omni',
"   \ 'whitelist': ['*'],
"   \ 'completor': function('asyncomplete#sources#omni#completor')
"   \  }))

" call add(g:plugins.start, $GITHUB_COM.'prabirshrestha/asyncomplete-file.vim')
" au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
"     \ 'name': 'file',
"     \ 'whitelist': ['*'],
"     \ 'priority': 10,
"     \ 'completor': function('asyncomplete#sources#file#completor')
"     \ }))

" call add(g:plugins.opt, $GITHUB_COM.'Shougo/neco-syntax')
" call add(g:plugins.start, $GITHUB_COM.'prabirshrestha/asyncomplete-necosyntax.vim')
" au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necosyntax#get_source_options({
"     \ 'name': 'necosyntax',
"     \ 'whitelist': ['*'],
"     \ 'completor': function('asyncomplete#sources#necosyntax#completor'),
"     \ }))
