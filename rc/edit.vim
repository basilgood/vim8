scriptencoding utf-8

" editorconfig.
let g:editorconfig_root_chdir = 1
let g:editorconfig_verbose    = 1
let g:editorconfig_blacklist  = {
      \ 'filetype': ['git.*', 'fugitive'],
      \ 'pattern': ['\.un~$']}

" surround.
let surround_indent=1
nmap S ysiw

" traces.
nnoremap ss :%s/
nnoremap sl :s/
nnoremap sr :s/\<<C-r><C-w>\>/
vnoremap s  :'<,'>s/
nnoremap sa :%s/\<<c-r><c-w>\>/<c-r><c-w>
nnoremap sp vip :s/
nnoremap sw :%s/\<<c-r><c-w>\>/

" cmdline-completion.
autocmd vimRc CmdlineEnter * packadd cmdline-completion

" undotree.
let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
nnoremap <leader>u :UndotreeToggle<cr>

" easy-align.
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" hlnext
nnoremap <silent> n nzz:call functions#hlnext()<cr>
nnoremap <silent> N Nzz:call functions#hlnext()<cr>
nnoremap <silent> [Space]n :nohlsearch<CR>

" wildfire.
let g:wildfire_objects = [ 'iw', 'il', "i'", "a'", 'i"', 'i)', 'a)', 'i]', 'a]', 'i}', 'a}', 'i<', 'a<', 'ip', 'it']
let g:wildfire_fuel_map = '+'
let g:wildfire_water_map = '-'
nmap <leader>s <Plug>(wildfire-quick-select)

" edge motion.
map <C-j> <Plug>(edgemotion-j)
map <C-k> <Plug>(edgemotion-k)

" ags.
let g:ags_winplace = 'right'
let g:neomake_highlight_columns = 0
let g:neomake_error_sign = {
      \ 'text': '_e',
      \ 'texthl': 'ErrorMsg',
      \ }
let g:neomake_warning_sign = {
      \ 'text': '_w',
      \ 'texthl': 'WarningMsg',
      \ }
let g:neomake_message_sign = {
      \ 'text': '➤',
      \ 'texthl': 'NeomakeMessageSign',
      \ }
let g:neomake_info_sign = {
      \ 'text': 'ℹ',
      \ 'texthl': 'NeomakeInfoSign'
      \ }
" let g:neomake_javascript_eslint_exe = nrun#Which('eslint')
" let g:neomake_javascript_enabled_makers = ['eslint']
" let g:neomake_nix_enabled_makers = ['nix']
augroup my_neomake
  autocmd!
  autocmd FileType nix call neomake#configure#automake('w')
augroup END
