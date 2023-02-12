vim9script
runtime defaults.vim
runtime! macros/matchit.vim

augroup vimRc
  autocmd!
augroup END

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
Plug 'jonsmithers/vim-html-template-literals'
Plug 'wuelnerdotexe/vim-astro'
Plug 'LnL7/vim-nix'
Plug 'sgur/vim-editorconfig'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/conflict-marker.vim'
Plug 'voldikss/vim-floaterm'
Plug 'fcpg/vim-altscreen'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'basilgood/hlyank.vim'
Plug 'tommcdo/vim-exchange'
Plug 'linjiX/vim-star'
Plug 'markonm/traces.vim'
Plug 'romainl/vim-cool'
Plug 'sgur/cmdline-completion'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'AndrewRadev/quickpeek.vim'
Plug 'opalmay/vim-smoothie'
Plug 'simeji/winresizer'
plug#end()

# netrw
g:netrw_list_hide = '^./$,^../$'
g:netrw_bufsettings = 'noma nomod nonu nobl nowrap ro nornu nocul'
g:netrw_banner = 0
g:netrw_preview = 1
g:netrw_alto = 'spr'
g:netrw_altfile = 1
g:netrw_use_errorwindow = 0
g:netrw_special_syntax = 1

autocmd vimRc FileType netrw nmap <buffer> . mfmx

def Ls(): void
  var file = expand('%:t')
  execute 'Explore' expand('%:p:h')
  search(file, 'wc')
enddef

command! Ex Ls()
nnoremap <silent> - :Ex<cr>

# fzf
$FZF_DEFAULT_COMMAND = 'fd -tf -L -H -E=.git -E=node_modules --strip-cwd-prefix'
g:fzf_layout = {'window': {'width': 0.7, 'height': 0.8, 'border': 'sharp'}}
g:fzf_preview_window = ['up:70%', 'ctrl-/']
nnoremap <c-p> :Files<cr>
cabbrev ff Files %:p:h
nnoremap <bs> :Buffers<cr>

# coc.nvim
g:coc_global_extensions = [
  'coc-coverage',
  'coc-diagnostic',
  'coc-docthis',
  'coc-eslint',
  'coc-git',
  'coc-html',
  'coc-lit-html',
  'coc-css',
  'coc-html-css-support',
  'coc-htmldjango',
  'coc-json',
  'coc-markdownlint',
  'coc-snippets',
  'coc-rust-analyzer',
  'coc-tsserver',
  'coc-vimlsp',
]

nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap <leader>r <Plug>(coc-references)
nmap K :call CocAction('doHover')<cr>
nmap <c-k> :call CocAction('showSignatureHelp')<cr>
nmap <F2> <Plug>(coc-rename)
nmap <F3> <Plug>(coc-refactor)
nmap <F4> <Plug>(coc-codeaction-cursor)
nmap <leader>d <cmd>CocDiagnostics<cr>
nnoremap gq :call CocAction('format')<cr>

command! -nargs=0 Format call CocAction('format')
command! -nargs=0 OI call CocAction('runCommand', 'editor.action.organizeImport')

inoremap <silent><expr> <tab> coc#pum#visible() ? coc#pum#next(1) : '<tab>'
inoremap <expr><s-tab> coc#pum#visible() ? coc#pum#prev(1) : "<c-h>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "<cr><c-r>=coc#on_enter()<cr>"
g:coc_snippet_next = '<c-l>'
g:coc_snippet_prev = '<c-h>'
nmap [d <Plug>(coc-diagnostic-prev)
nmap ]d <Plug>(coc-diagnostic-next)
nmap <leader><leader> <Plug>(coc-diagnostic-info)
nmap <expr> ]c &diff ? ']c' : '<Plug>(coc-git-nextchunk)'
nmap <expr> [c &diff ? '[c' : '<Plug>(coc-git-prevchunk)'
nnoremap <silent> ghu :CocCommand git.chunkUndo<cr>
nnoremap <silent> ghs :CocCommand git.chunkStage<cr>
nnoremap <silent> ghp :CocCommand git.chunkInfo<cr>
nnoremap <silent> ghb :CocCommand git.browserOpen<cr>
nnoremap <silent> ghc :CocCommand git.showCommit<cr>
nnoremap <silent> ghg :CocCommand git.showBlameDoc<cr>

# lit
g:html_indent_style1 = 'inc'
g:htl_css_templates = 1
g:htl_all_templates = 1

# floaterm
g:floaterm_height = 0.9
g:floaterm_width = 0.9
g:floaterm_autoclose = 2
g:floaterm_keymap_toggle = '<C-q>'

# star
vmap <silent> * <Plug>(star-*)
nmap <silent> * <Plug>(star-*)

# quickpeek
g:quickpeek_popup_options = {
  borderchars: ['-', '|', '-', '|', '+', '+', '+', '+'],
  title:       'Preview',
}
g:quickpeek_window_settings = ['cursorline', 'number']
autocmd vimRc Filetype qf nnoremap <buffer> <tab> :QuickpeekToggle<cr>

# winresizer
g:winresizer_start_key = 'gw'

# options
&t_EI = "\e[2 q"
&t_SR = "\e[4 q"
&t_SI = "\e[6 q"
set t_ut=
set path=.,**
set noswapfile hidden gdefault
set autoread autowriteall  nowritebackup
set undofile undodir=~/.cache/vim/,.
set matchpairs-=<:>
set autoindent expandtab tabstop=2 shiftwidth=0 softtabstop=-1
set number ttymouse=sgr signcolumn=yes fillchars=vert:│
set splitright splitbelow
set nowrap nostartofline noshowmode hlsearch
set sidescrolloff=5 sidescroll=1
set sessionoptions=buffers,curdir,folds,tabpages,winsize
set lazyredraw updatetime=250
set diffopt+=context:3,indent-heuristic,algorithm:patience
set list listchars=tab:🢝\ ,lead:·,trail:·,nbsp:␣
set shortmess=aAIoOsc
set pumheight=5
set wildmode=longest:full,full
set wildoptions=pum
set wildignorecase
if executable('rg')
  set grepprg=rg\ --vimgrep
else
  set grepprg=grep\ -rnHI
endif
set laststatus=2
set statusline=%2{mode()}\ \|\ %t%m%r%=%c,%l/%L\ \ %y

# mappings
nnoremap <silent> <c-w>d :b#<bar>bd#<cr>
nnoremap <silent> <C-w>z :wincmd z<Bar>cclose<Bar>lclose<CR>
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
nnoremap vv viw
xnoremap il g_o^
onoremap il :<C-u>normal vil<CR>
vnoremap . :normal .<CR>
nnoremap <silent> 3<C-g> :echon system('cat .git/HEAD')->split('\n')<CR>
nnoremap <silent> <C-l> :noh<bar>diffupdate<bar>syntax sync fromstart<cr><c-l>
nnoremap [q :cprev<cr>
nnoremap ]q :cnext<cr>

# autocmds
autocmd vimRc InsertLeave * {
  if &diff
    diffupdate
  endif
}

autocmd vimRc BufWritePre * {
  if !isdirectory(expand('%:h', v:true))
    mkdir(expand('%:h', v:true), 'p')
  endif
}

# filetypes
g:markdown_fenced_languages = ['ruby', 'html', 'javascript', 'css', 'bash=sh', 'sh']
autocmd vimRc BufNewFile,BufReadPost *.md,*.markdown setlocal conceallevel=2 concealcursor=n
autocmd vimRc BufNewFile,BufReadPost *.gitignore setfiletype gitignore
autocmd vimRc BufNewFile,BufReadPost config      setfiletype config
autocmd vimRc BufNewFile,BufReadPost *.lock      setfiletype config
autocmd vimRc BufNewFile,BufReadPost .babelrc    setfiletype json
autocmd vimRc BufNewFile,BufReadPost *.txt       setfiletype markdown
autocmd vimRc BufWinEnter *.njk       setfiletype htmldjango
autocmd vimRc BufNewFile,BufReadPost *.json  setlocal conceallevel=0 concealcursor=
autocmd vimRc BufNewFile,BufReadPost *.json  setlocal formatoptions=
autocmd vimRc BufNewFile,BufReadPost *.html,*.javascript  setlocal matchpairs-=<:>
autocmd vimRc FileType qf,help wincmd J
autocmd vimRc FileType * set formatoptions-=o

# highlight groups
def SynGroup(): void
  const s = synID(line('.'), col('.'), 1)
  echo synIDattr(s, 'name') .. ' -> ' .. synIDattr(synIDtrans(s), 'name')
enddef
command HL SynGroup()

# sudo edit
cabbrev w!! w !sudo tee > /dev/null %

# sessions
const session_path = expand('~/.cache/vim/sessions/')
if !isdirectory(session_path)
  mkdir(session_path, 'p')
endif
autocmd! vimRc VimLeavePre * {
  execute 'mksession! ' .. session_path .. split(getcwd(), '/')[-1]
}
command! -nargs=0 SS {
  silent! execute 'source ' .. session_path .. split(getcwd(), '/')[-1]
}
nnoremap <silent><leader>s :SS<cr>

# colorscheme
set termguicolors
set background=dark
colorscheme selenized_bw

set secure
