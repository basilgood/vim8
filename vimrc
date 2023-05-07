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
Plug 'neoclide/coc.nvim', {'branch': 'release', 'on': []}
Plug 'dense-analysis/ale'
Plug 'pangloss/vim-javascript'
Plug 'jonsmithers/vim-html-template-literals'
Plug 'LnL7/vim-nix'
Plug 'sgur/vim-editorconfig'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'Eliot00/git-lens.vim'
Plug 'rhysd/conflict-marker.vim'
Plug 'fcpg/vim-altscreen'
Plug 'tpope/vim-commentary'
Plug 'yaocccc/vim-comment'
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
Plug 'basilgood/istanbul.vim'
Plug 'basilgood/cinnamon-vim'
plug#end()

# netrw
g:netrw_list_hide = '^\./$,^\.\./$'
g:netrw_bufsettings = 'noma nomod nonu nobl nowrap ro nornu nocul'
g:netrw_banner = 0
g:netrw_preview = 1
g:netrw_alto = 0
g:netrw_altfile = 1
g:netrw_use_errorwindow = 0
g:netrw_special_syntax = 1

autocmd vimRc FileType netrw nmap <buffer> . mfmx
command! Ex edit %:p:h
nnoremap <silent> - :Ex<cr>

# fzf
$FZF_DEFAULT_COMMAND = 'fd -tf -L -H -E=.git -E=node_modules --strip-cwd-prefix'
g:fzf_layout = {'window': {'width': 0.7, 'height': 0.8, 'border': 'sharp'}}
g:fzf_preview_window = ['up:70%', 'ctrl-/']
nnoremap <c-p> :Files<cr>
cabbrev ff Files %:p:h
nnoremap <bs> :Buffers<cr>

# coc.nvim
autocmd vimRc BufReadPost * plug#load('coc.nvim')
g:coc_global_extensions = [
  'coc-html',
  'coc-css',
  'coc-html-css-support',
  'coc-json',
  'coc-markdownlint',
  'coc-snippets',
  'coc-rust-analyzer',
  'coc-tsserver',
  'coc-vimlsp',
]

g:coc_user_config = {
  coc: {
    preferences: {
      enableMessageDialog: true,
      useQuickfixForLocations: true
    },
  },
  suggest: {
    noselect: true,
    enablePreselect: false,
    insertMode: 'replace',
    detailField: 'abbr'
  },
  signature: {target: 'echo'},
  diagnostic: {displayByAle: v:true},
  html: {
    filetypes: ['html', 'htmldjango', 'astro', 'jinja', 'javascript']
  },
  html-css-support: {
    enabledLanguages: ['html', 'htmldjango', 'astro', 'jinja', 'javascript'],
  },
  rust-analyzer: {
    checkOnSave: true,
    lens: {enable: true},
    updates: {prompt: true},
    signatureInfo: {detail: 'parameters'},
    inlayHints: {
      typeHints: {enable: false},
      parameterHints: {enable: false},
      chainingHints: {enable: false},
    },
  },
  markdownlint: {
    config: { 'line-length': false }
  }
}

inoremap <silent><expr> <tab> coc#pum#visible() ? coc#pum#next(1) : '<tab>'
inoremap <expr><s-tab> coc#pum#visible() ? coc#pum#prev(1) : "<c-h>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "<cr><c-r>=coc#on_enter()<cr>"
g:coc_snippet_next = '<c-l>'
g:coc_snippet_prev = '<c-h>'

nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap <leader>r <Plug>(coc-references)
nmap K :call CocAction('doHover')<cr>
nmap <c-k> :call CocAction('showSignatureHelp')<cr>
nmap <F2> <Plug>(coc-rename)
nmap <F3> <Plug>(coc-refactor)
nmap <F4> <Plug>(coc-codeaction-cursor)
nmap <leader>d <cmd>CocDiagnostics<cr>

command! -nargs=0 OI call CocAction('runCommand', 'editor.action.organizeImport')

# git
g:gitgutter_sign_priority = 8
g:gitgutter_preview_win_floating = 1
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
nnoremap <silent> ghd :GitGutterDiffOrig<cr>
nnoremap <silent> ghb :call ToggleGitLens()<cr>
autocmd vimRc BufWritePost * GitGutter

# ale
g:ale_completion_enabled = 0
g:ale_disable_lsp = 1
g:ale_virtualtext_cursor = 0
g:ale_sign_error = 'E'
g:ale_sign_warning = 'W'
g:ale_sign_info = 'I'
g:ale_echo_msg_format = '[%linter%]: %s'
g:ale_sh_shfmt_options = '-i 2 -ci -sr'
g:ale_fixers = {
  sh: ['shfmt'],
  javascript: ['prettier'],
  html: ['prettier'],
  css: ['prettier'],
  json: ['fixjson'],
  nix: ['alejandra'],
  yaml: ['yamlfix'],
}

nnoremap ]d <Plug>(ale_next_wrap)
nnoremap [d <Plug>(ale_previous_wrap)
nnoremap Q :ALEFix<cr>

# toggle autoformat
def ToggleAutoFormat()
  g:ale_fix_on_save = !g:ale_fix_on_save
enddef
command! FM ToggleAutoFormat()
nnoremap <leader><leader> :FM<cr>

# lit
g:html_indent_style1 = 'inc'
g:htl_css_templates = 1
g:htl_all_templates = 1

# istanbul
g:istanbul#jsonPath = ['.tmp/coverage/coverage-final.json']
nnoremap ]k :IstanbulNext<cr>
nnoremap [k :IstanbulBack<cr>

# star
vmap <silent> * <Plug>(star-*)
nmap <silent> * <Plug>(star-*)
nnoremap <silent> gs <Plug>(star-*)cgn
xnoremap <silent> gs <Plug>(star-*)cgn

# block comments
xmap <silent> ?  :<c-u>CToggleComment<CR>
smap <silent> ?  <c-g>:<c-u>CToggleComment<CR>

# quickpeek
g:quickpeek_popup_options = {
  borderchars: ['-', '|', '-', '|', '+', '+', '+', '+'],
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
set autoindent smartindent
set expandtab tabstop=2 shiftwidth=2 softtabstop=2
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
set wildcharm=<c-z>
if executable('rg')
  set grepprg=rg\ --vimgrep
else
  set grepprg=grep\ -rnHI
endif
set laststatus=2
set statusline=%{expand('%:p:h:t')}/%t%r%m%=%c,%l/%L%y

# mappings
nnoremap <silent> <c-w>d :b#<bar>bw#<cr>
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
g:markdown_fenced_languages = ['ruby', 'html', 'javascript', 'css', 'bash=sh', 'sh', 'lua', 'vim']
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
autocmd vimRc FileChangedShellPost * checktime

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

colorscheme kanagawa

set secure
