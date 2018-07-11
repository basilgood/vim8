scriptencoding utf-8

" editorconfig
let g:editorconfig_root_chdir = 1
let g:editorconfig_verbose = 1
let g:editorconfig_blacklist = {
      \ 'filetype': ['git.*', 'fugitive'],
      \ 'pattern': ['\.un~$']}

" leaderf
let g:Lf_ShortcutF = '<C-P>'
" let g:Lf_ShortcutB = '<Bs>'
let g:Lf_WindowHeight = 0.20
let g:Lf_DefaultMode = 'FullPath'
let g:Lf_FollowLinks = 'yes'
nnoremap <Leader>m :LeaderfMru<CR>
nnoremap <Leader>n :LeaderfMruCwd<CR>
nnoremap <Leader>k :LeaderfHistoryCmd<CR>
nnoremap <Leader>p :LeaderfFilePattern<Space>

" nerdtree
nnoremap - :NERDTreeToggle<CR>
nnoremap <F2> :NERDTreeFind<CR>
let g:NERDTreeMouseMode = 3
let g:NERDTreeShowHidden = 1
let g:NERDTreeHijackNetrw = 0

" asterisk
map *  <Plug>(asterisk-z*)
map #  <Plug>(asterisk-z#)
map g* <Plug>(asterisk-gz*)
map g# <Plug>(asterisk-gz#)
let g:asterisk#keeppos = 1

" ale lint
let g:ale_set_highlights = 0
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_sign_info = 'i'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_pattern_options_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 1000
let g:ale_sign_warning = '──'
let g:ale_sign_error = '══'

" quickbuf
nnoremap <Bs> :Ls<CR>

" ag grep
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
let g:ackhighlight = 1
let g:ack_mappings = { 'o': '<CR>zz' }
nnoremap ,f :<C-u>Ack!<CR>
nnoremap ,g :<C-u>Ack!<Space>

" easymotion
map <Leader> <Plug>(easymotion-prefix)
nmap <Leader>s <Plug>(easymotion-overwin-f2)

" choosewin
nmap  ,l  <Plug>(choosewin)

" prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#config#bracket_spacing = 'false'
let g:prettier#config#use_tabs = 'true'

" permissions
nnoremap <F3> :call fileinfo#GetFileInfo()<CR>

" ranger
nnoremap <leader><leader> :call ranger#RangerExplorer()<CR>

" over
nnoremap <Space>s :OverCommandLine<CR>%s/
nnoremap <Space>S :OverCommandLine<CR>s/
vnoremap <Space>s :OverCommandLine<CR>s/

" blink and center
nnoremap <silent> n nzz:call blink#Match()<CR>
nnoremap <silent> N Nzz:call blink#Match()<CR>
cnoremap <silent> <expr> <enter> center#Search()

" fugitive
nmap <Leader>g :Gstatus<CR>gg<c-n>
nnoremap <Leader>d :Gvdiff<CR>
