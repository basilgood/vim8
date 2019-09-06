scriptencoding utf-8

Plugin 'editorconfig/editorconfig-vim'
autocmd VGroup BufRead * call vivid#enable('editorconfig-vim')
let g:EditorConfig_exclude_patterns = ['fugitive://.\*', 'scp://.\*']

Plugin 'tpope/vim-repeat'
autocmd VGroup BufRead * call vivid#enable('vim-repeat')

Plugin 'tpope/vim-surround'
autocmd VGroup BufRead * call vivid#enable('vim-surround')
let surround_indent=1
nmap S ysiw
nmap sl yss

Plugin 'tomtom/tcomment_vim'
autocmd VGroup BufRead * call vivid#enable('tcomment_vim')

Plugin 'markonm/traces.vim'
autocmd VGroup BufRead * call vivid#enable('traces.vim')

Plugin 'sgur/cmdline-completion'
autocmd VGroup BufRead * call vivid#enable('cmdline-completion')

Plugin 'markonm/hlyank.vim'
autocmd VGroup BufRead * call vivid#enable('hlyank.vim')

Plugin 'mbbill/undotree', { 'command': ['UndotreeToggle'] }
let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
nnoremap <leader>u :UndotreeToggle<cr>

Plugin 'junegunn/vim-easy-align', { 'command': ['EasyAlign'] }
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

Plugin 'embear/vim-localvimrc', { 'command': ['LocalVimRC'] }

Plugin 'itchyny/vim-parenmatch'
autocmd VGroup BufRead * call vivid#enable('vim-parenmatch')

Plugin 'wellle/targets.vim'
autocmd VGroup BufRead * call vivid#enable('targets.vim')
