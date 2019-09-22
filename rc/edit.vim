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
