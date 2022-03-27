vim9script
scriptencoding utf-8

augroup vimRc
  autocmd!
augroup END

packadd! matchit

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

plug#begin('~/.vim/plugged')

Plug 'basilgood/vaffle.vim'
g:vaffle_force_delete = 1
nnoremap <silent> - :execute 'Vaffle' expand('%')<cr>
autocmd vimRc FileType vaffle {
  nmap <buffer><silent> <left> <Plug>(vaffle-open-parent)
  nmap <buffer><silent> <right> <Plug>(vaffle-open-current)
  }

Plug 'junegunn/fzf.vim'
$FZF_DEFAULT_OPTS = '--layout=reverse --inline-info --tac --ansi --margin 1,4'
$FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --color=always --exclude .git'
g:fzf_layout = { 'window': { 'width': 0.85, 'height': 0.95 } }
g:fzf_preview_window = ['up:80%', 'ctrl-/']
nnoremap <c-p> :Files<cr>
nnoremap <bs> :Buffers<cr>

Plug 'dense-analysis/ale'
g:ale_disable_lsp = 1
g:ale_sign_error = ' '
g:ale_sign_warning = ' '
g:ale_sign_info = '🛈 '
g:ale_set_highlights = 0
g:ale_lint_on_text_changed = 'normal'
g:ale_lint_on_insert_leave = 1
nmap <silent> [a <Plug>(ale_previous)
nmap <silent> ]a <Plug>(ale_next)
g:ale_fixers = {
  'javascript': ['eslint'],
  'css': ['prettier'],
  'json': ['prettier'],
  'sh': ['shfmt'],
  'nix': ['nixpkgs-fmt'],
  }

Plug 'prabirshrestha/vim-lsp'
autocmd vimRc FileType javascript {
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nnoremap <buffer> gd <plug>(lsp-definition)
  nnoremap <buffer> gr :<C-u>LspReferences<CR>
  nnoremap <buffer> K :<C-u>LspHover<CR>
  }

Plug 'mattn/vim-lsp-settings'
Plug 'rhysd/vim-lsp-ale'

Plug 'vim-denops/denops.vim'
Plug 'Shougo/ddc.vim'
Plug 'shun/ddc-vim-lsp'
Plug 'matsui54/ddc-buffer'
Plug 'LumaKernel/ddc-file'
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'
Plug 'Shougo/ddc-converter_remove_overlap'

Plug 'vim-autoformat/vim-autoformat', {'on': 'Autoformat'}
g:formatters_javascript = ['prettier']
# g:run_all_formatters_javascript = 1
cabbrev af Autoformat

Plug 'airblade/vim-gitgutter'
g:gitgutter_preview_win_floating = 1
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

Plug 'tpope/vim-fugitive'
Plug 'whiteinge/diffconflicts'

Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'

Plug 'alvan/vim-closetag'
g:closetag_filenames = '*.html,*.xhtml,*.js,*.erb,*.jsx,*.tsx'

Plug 'LnL7/vim-nix',{'for': 'nix'}
Plug 'cespare/vim-toml',{'for': 'toml'}
Plug 'sgur/vim-editorconfig'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'markonm/traces.vim'
g:traces_num_range_preview = 1

Plug 'basilgood/memolist.vim', {'on': ['MemoList', 'MemoGrep', 'MemoNew']}
g:memolist_memo_suffix = 'md'
g:memolist_fzf = 1

Plug 'AndrewRadev/quickpeek.vim', {'for': 'qf'}
autocmd vimRc Filetype qf nnoremap <buffer> <tab> :QuickpeekToggle<cr>

Plug 'voldikss/vim-floaterm'
g:floaterm_height = 0.9
g:floaterm_width = 0.9
g:floaterm_autoclose = 2
g:floaterm_keymap_toggle = '<C-q>'
tnoremap <c-x> <c-\><c-n>

Plug 'wellle/targets.vim'
g:targets_nl = 'nN'

Plug 'svermeulen/vim-subversive'
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteRange)
xmap ss <plug>(SubversiveSubstituteRange)
nmap s. <plug>(SubversiveSubstituteWordRange)
nmap sc <plug>(SubversiveSubstituteRangeConfirm)
xmap sc <plug>(SubversiveSubstituteRangeConfirm)
nmap s, <plug>(SubversiveSubstituteWordRangeConfirm)

Plug 'junegunn/limelight.vim'
nmap X <Plug>(Limelight)
xmap X <Plug>(Limelight)

Plug 'markonm/hlyank.vim', {'commit': '39e52017'}
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'blueyed/vim-qf_resize'
Plug 'vim-scripts/cmdline-completion'
Plug 'fcpg/vim-altscreen'

Plug 'haya14busa/vim-asterisk'
g:asterisk#keeppos = 1
map *  <Plug>(asterisk-z*)
map g* <Plug>(asterisk-gz*)
map #  <Plug>(asterisk-z#)
map g# <Plug>(asterisk-gz#)

Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
g:undotree_WindowLayout = 4
g:undotree_SetFocusWhenToggle = 1
g:undotree_ShortIndicators = 1

Plug 'romainl/vim-cool'

plug#end()

# complete ddc
ddc#custom#patch_global('sources', [
  'vim-lsp',
  'buffer',
  'file',
  ])
ddc#custom#patch_global('sourceOptions', {
  '_': {
    'matchers': ['matcher_head'],
    'sorters': ['sorter_rank'],
    'converters': ['converter_remove_overlap'],
    'ignoreCase': v:true,
    'minAutoCompleteLength': 1,
    },
  'vim-lsp': {
    'mark': 'L',
    'isVolatile': v:true,
    'matchers': ['matcher_head'],
    'forceCompletionPattern': '\.|:|->|"\w*/*'
    },
  'buffer': {'mark': 'B'},
  'file': {
    'mark': 'F',
    'isVolatile': v:true,
    'forceCompletionPattern': '\S/\S*'
    },
  })
ddc#enable()
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><CR> pumvisible() ? "\<C-Y>" : "\<CR>"

# options
&t_SI = "\e[6 q"
&t_SR = "\e[4 q"
&t_EI = "\e[2 q"
set t_ut=
set t_md=
set path=,,.,tests/**
set path+=lib/**,views/**,cz-components/**,test/**
set wildignore+=*/node_modules/*,*/.git/*,*/recordings/*,*/pack
set hidden
set gdefault
set autoread autowrite autowriteall
set noswapfile
set nowritebackup
set undofile undodir=/tmp/,.
set autoindent smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set nostartofline
set nojoinspaces
set nofoldenable
set nowrap
&showbreak = '↳ '
set breakindent
set breakindentopt=sbr
set noshowmode
set nrformats-=octal
set number
set mouse=a ttymouse=sgr
set signcolumn=yes
set splitright splitbelow
set fillchars=stl:-,stlnc:-,vert:\│,fold:\ ,diff:-
set virtualedit=onemore
set sidescrolloff=10 sidescroll=1
set sessionoptions-=options
set sessionoptions-=blank
set sessionoptions-=help
set lazyredraw
set timeoutlen=1200
set ttimeoutlen=50
set updatetime=150
set incsearch hlsearch
set completeopt+=noselect,noinsert
set pumheight=10
set diffopt+=context:3,indent-heuristic,algorithm:patience
set list
set listchars=tab:┊\ ,trail:•,nbsp:␣,extends:↦,precedes:↤
autocmd vimRc InsertEnter * set listchars-=trail:•
autocmd vimRc InsertLeave * set listchars+=trail:•
set shortmess=
set shortmess+=asoOtIcF
set confirm
set history=1000
set viminfo^=!
set wildmenu
set wildoptions=pum,tagfile
set wildignorecase
set wildcharm=<C-Z>
set grepprg=grep\ -rnH
&grepformat = '%f:%l:%c:%m,%f:%l:%m'
&errorformat ..= ',%f\|%\s%#%l col%\s%#%c%\s%#\| %m'
set backspace=indent,eol,start
set laststatus=2
# set statusline=%<%.99{expand('%:p:h:t')}/%t\ %*%h%w%m%r%=%{&filetype}%7c:%l/%L
set statusline=
set statusline+=%<%t
set statusline+=\ %{&mod?'🔺':'✔'}
set statusline+=\ %h%w%r
set statusline+=%=
set statusline+=\ %c:%l/%L
set statusline+=\ ---\ %{&ft}

# mappings
# wrap
noremap j gj
noremap k gk
# redline
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>
# paragraph
nnoremap } }zz
nnoremap { {zz
# close qf
nnoremap <silent> <C-w>z :wincmd z<Bar>cclose<Bar>lclose<CR>
# objects
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<cr>
xnoremap <silent> ie gg0oG$
onoremap <silent> ie :<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<cr>
nnoremap vv viw
# repeat on visual selection
vnoremap . :normal .<CR>
# c-g improved
nnoremap <silent> <C-g> :echon '['.expand("%:p:~").']'.' [L:'.line('$').']'<Bar>echon ' ['system("git rev-parse --abbrev-ref HEAD 2>/dev/null \| tr -d '\n'")']'<CR>
# reload syntax and nohl
nnoremap <silent> <C-l> :noh<bar>diffupdate<bar>call clearmatches()<bar>Limelight!<bar>syntax sync fromstart<cr><c-l>
# execute macro
nnoremap Q <Nop>
nnoremap Q @q
# run macro on selected lines
xnoremap Q :norm Q<cr>

# autocmds
# keep cursor position
au BufReadPost * {
  if line("'\"") > 1 && line("'\"") <= line("$") && &filetype != 'gitcommit'
    exe 'normal! g`"'
  endif
  }

# help keep widow full width
autocmd vimRc FileType qf wincmd J
autocmd vimRc BufWinEnter * {
  if &ft == 'help'
    wincmd J
  endif
  }

# update diff / disable paste
autocmd vimRc InsertLeave * {
  if &diff
    diffupdate
  endif
  }
autocmd vimRc InsertLeave * {
  if &paste
    setlocal nopaste
    echo 'nopaste'
  endif
  }

# external changes
autocmd vimRc FocusGained,CursorHold * {
  if !bufexists("[Command Line]")
    checktime
  endif
  if exists('g:loaded_gitgutter')
    gitgutter#all(1)
  endif
  }

# mkdir
autocmd vimRc BufWritePre * {
  if !isdirectory(expand('%:h', v:true))
    mkdir(expand('%:h', v:true), 'p')
  endif
  }

# filetypes
g:markdown_fenced_languages = ['vim', 'ruby', 'html', 'js=javascript', 'json', 'css', 'bash=sh', 'sh']
autocmd vimRc BufReadPre *.md,*.markdown setlocal conceallevel=2 concealcursor=n
autocmd vimRc FileType javascript setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd vimRc BufNewFile,BufRead *.gitignore setfiletype gitignore
autocmd vimRc BufNewFile,BufRead config      setfiletype config
autocmd vimRc BufNewFile,BufRead *.lock      setfiletype config
autocmd vimRc BufNewFile,BufRead .babelrc    setfiletype json
autocmd vimRc BufNewFile,BufRead *.txt       setfiletype markdown
autocmd vimRc BufReadPre *.json  setlocal conceallevel=0 concealcursor=
autocmd vimRc BufReadPre *.json  setlocal formatoptions=
autocmd vimRc FileType git       setlocal nofoldenable
autocmd vimRc FileType scss setlocal iskeyword+=@-@

# commands
command TrimWhitespace {
    var save = winsaveview()
    keeppattern :%s/\s\+$//e
    winrestview(save)
    }
command! WW w !sudo tee % > /dev/null
command HL {
  echo synIDattr(synID(line('.'), col('.'), 0), 'name')
  echo synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
  }

# sessions
g:session_path = expand('~/.cache/vim/sessions/')
if !isdirectory(g:session_path)
  mkdir(g:session_path, 'p')
endif
autocmd! vimRc VimLeavePre * {
  execute 'mksession! ' .. g:session_path .. split(getcwd(), '/')[-1]
  }
command! -nargs=0 SS {
  execute 'source ' .. g:session_path .. split(getcwd(), '/')[-1]
  }
nnoremap <F2> :SS<cr>

# grep
def Grep(word: string): void
  var cmd = printf('rg --vimgrep --no-heading %s', word)
  cgetexpr system(cmd)
  cw
enddef
command -nargs=1 -complete=file Grep {
  Grep(<q-args>)
  }

set termguicolors
colorscheme boa

set secure
