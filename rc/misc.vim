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

" undotree.
call add(g:plugins.opt, $GITHUB_COM.'mbbill/undotree')
let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
nnoremap <leader>u :UndotreeToggle<cr>

" ferret, grep async
call add(g:plugins.opt, $GITHUB_COM.'wincent/ferret')
nnoremap <leader>f :Ack<space>

" completion
call add(g:plugins.opt, $GITHUB_COM.'lifepillar/vim-mucomplete')
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#completion_delay = 1
let g:mucomplete#chains = {}
let g:mucomplete#chains.default  = ['path', 'omni', 'keyn', 'dict', 'uspl', 'ulti']
let g:mucomplete#chains.markdown = ['path', 'keyn', 'dict', 'uspl']
let g:mucomplete#chains.vim      = ['path', 'keyn', 'dict', 'uspl']
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
