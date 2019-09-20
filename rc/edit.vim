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

" searchhi.
let g:searchhi_clear_all_autocmds = 'InsertEnter'
let g:searchhi_update_all_autocmds = 'InsertLeave'
let g:indexed_search_mappings = 0

nmap / <Plug>(searchhi-/)
nmap ? <Plug>(searchhi-?)

vmap / <Plug>(searchhi-v-/)
vmap ? <Plug>(searchhi-v-?)

nmap n <Plug>(searchhi-n) :<C-u>ShowSearchIndex<CR> zz
nmap N <Plug>(searchhi-N) :<C-u>ShowSearchIndex<CR> zz

vmap n <Plug>(searchhi-v-n)
vmap N <Plug>(searchhi-v-N)

nmap <silent> [Space]n <Plug>(searchhi-clear-all)
vmap <silent> [Space]n <Plug>(searchhi-v-clear-all)

" wildfire.
let g:wildfire_objects = [ 'iw', 'il', "i'", "a'", 'i"', 'i)', 'a)', 'i]', 'a]', 'i}', 'a}', 'i<', 'a<', 'ip', 'it']
let g:wildfire_fuel_map = '+'
let g:wildfire_water_map = '-'
nmap <leader>s <Plug>(wildfire-quick-select)

" edge motion.
map <C-j> <Plug>(edgemotion-j)
map <C-k> <Plug>(edgemotion-k)

" closetag.
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.twig,*.html.twig'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js,*.twig,*.html.twig'
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,javascript,twig,html.twig'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,javascript,twig,html.twig'

" ags.
let g:ags_winplace = 'right'
