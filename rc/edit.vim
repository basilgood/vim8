scriptencoding utf-8

" editorconfig.
call add(g:plugins.opt, $GITHUB_COM.'sgur/vim-editorconfig')
let g:editorconfig_root_chdir = 1
let g:editorconfig_verbose    = 1
let g:editorconfig_blacklist  = {
      \ 'filetype': ['git.*', 'fugitive'],
      \ 'pattern': ['\.un~$']}

" comment
call add(g:plugins.opt, $GITHUB_COM.'tpope/vim-commentary')

" repeat
call add(g:plugins.opt, $GITHUB_COM.'tpope/vim-repeat')

" surround.
call add(g:plugins.opt, $GITHUB_COM.'tpope/vim-surround')
let g:surround_no_insert_mappings = 1
let surround_indent=1
nmap S ysiw

" text objects
call add(g:plugins.opt, $GITHUB_COM.'wellle/targets.vim')
call add(g:plugins.opt, $GITHUB_COM.'michaeljsmith/vim-indent-object')

" easyalign
call add(g:plugins.opt, $GITHUB_COM.'junegunn/vim-easy-align')
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" hlnext
nnoremap <silent> n nzz:call functions#hlnext()<cr>
nnoremap <silent> N Nzz:call functions#hlnext()<cr>
nnoremap <silent> [Space]n :nohlsearch<CR>

" wildfire.
call add(g:plugins.opt, $GITHUB_COM.'gcmt/wildfire.vim')
let g:wildfire_objects = [ 'iw', 'il', "i'", "a'", 'i"', 'i)', 'a)', 'i]', 'a]', 'i}', 'a}', 'i<', 'a<', 'ip', 'it']
let g:wildfire_fuel_map = '+'
let g:wildfire_water_map = '-'
nmap <leader>s <Plug>(wildfire-quick-select)

" edge motion.
call add(g:plugins.opt, $GITHUB_COM.'haya14busa/vim-edgemotion')
map <C-j> <Plug>(edgemotion-j)
map <C-k> <Plug>(edgemotion-k)
