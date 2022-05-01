vim9script noclear

if !v:vim_did_enter
  const startuptime = reltime()
  def Start(): void
    redraw
    echomsg 'startuptime: ' .. reltimestr(reltime(startuptime))
  enddef
  autocmd VimEnter * ++once Start()
endif

augroup vimRc
  autocmd!
augroup END

&packpath = $HOME .. '/.vim,' .. $VIMRUNTIME .. ',' .. $HOME .. '/.vim/after'
packadd! matchit

# minpac
if has('vim_starting')
  if empty(glob('~/.vim/pack/minpac/opt/minpac'))
    echo 'Install minpac ...'
    execute 'silent! !git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac'
  endif
endif

packadd minpac

# plug list
minpac#init()

minpac#add('k-takata/minpac', {'type': 'opt'})
minpac#add('rhysd/vim-color-spring-night', {'type': 'opt'})

# navigation
minpac#add('basilgood/vaffle.vim', {'type': 'opt'})
minpac#add('junegunn/fzf.vim', {'type': 'opt'})

# lsp
minpac#add('neoclide/coc.nvim', {'branch': 'release', 'type': 'opt'})

# lint and format
minpac#add('dense-analysis/ale', {'type': 'opt'})
minpac#add('vim-autoformat/vim-autoformat', {'type': 'opt'})

# lang
minpac#add('maxmellon/vim-jsx-pretty')
minpac#add('yuezk/vim-js')
minpac#add('jonsmithers/vim-html-template-literals')
minpac#add('LnL7/vim-nix')
minpac#add('cespare/vim-toml')

# misc
minpac#add('sgur/vim-editorconfig', {'type': 'opt'})
minpac#add('tpope/vim-commentary', {'type': 'opt'})
minpac#add('tpope/vim-surround', {'type': 'opt'})
minpac#add('tpope/vim-repeat', {'type': 'opt'})
minpac#add('wellle/targets.vim', {'type': 'opt'})
minpac#add('tommcdo/vim-exchange', {'type': 'opt'})
minpac#add('haya14busa/vim-asterisk', {'type': 'opt'})
minpac#add('haya14busa/vim-metarepeat', {'type': 'opt'})
minpac#add('markonm/traces.vim', {'type': 'opt'})
minpac#add('stefandtw/quickfix-reflector.vim')
minpac#add('blueyed/vim-qf_resize')
minpac#add('mbbill/undotree', {'type': 'opt'})
minpac#add('basilgood/memolist.vim', {'type': 'opt'})
minpac#add('markonm/hlyank.vim', { 'rev': '39e52017', 'type': 'opt' })
minpac#add('AndrewRadev/quickpeek.vim', {'type': 'opt'})
minpac#add('voldikss/vim-floaterm', {'type': 'opt'})
minpac#add('qxxxb/vim-searchhi', {'type': 'opt'})
minpac#add('fcpg/vim-altscreen')
minpac#add('vim-scripts/cmdline-completion', {'type': 'opt'})
minpac#add('svermeulen/vim-subversive', {'type': 'opt'})
minpac#add('AndrewRadev/tagalong.vim', {'type': 'opt'})
minpac#add('AndrewRadev/sideways.vim', {'type': 'opt'})
minpac#add('junegunn/limelight.vim', {'type': 'opt'})
minpac#add('chaoren/vim-expandtab', {'type': 'opt'})

# git
minpac#add('tpope/vim-fugitive', {'type': 'opt'})
minpac#add('whiteinge/diffconflicts', {'type': 'opt'})
minpac#add('hotwatermorning/auto-git-diff', {'type': 'opt'})

command! PackUpdate minpac#update()
command! PackClean minpac#clean()
command! PackStatus minpac#status()

# vaffle
autocmd vimRc VimEnter * ++once packadd vaffle.vim
g:vaffle_force_delete = 1
nnoremap <silent> - :call vaffle#init(expand('%'))<cr>
autocmd vimRc FileType vaffle {
  nmap <buffer><silent> <left> <Plug>(vaffle-open-parent)
  nmap <buffer><silent> <right> <Plug>(vaffle-open-current)
  }

# fzf
autocmd vimRc VimEnter * ++once packadd fzf.vim
$FZF_DEFAULT_OPTS = '--layout=reverse --inline-info --tac --ansi --margin 1,4'
$FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --color=always --exclude .git'
g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
g:fzf_preview_window = ['up:80%', 'ctrl-/']
g:fzf_colors = {}
g:fzf_colors['bg+']  = ['bg', 'CursorLine']
g:fzf_colors.border = ['fg', 'Comment']
nnoremap <c-p> :Files<cr>
nnoremap <bs> :Buffers<cr>

# ale
autocmd vimRc VimEnter * ++once packadd ale
g:ale_disable_lsp = 1
g:ale_sign_error = ' '
g:ale_sign_warning = ' '
g:ale_sign_info = ' '
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
g:ale_pattern_options = {
  '.*\.vim$': {'ale_enabled': 0},
  '.*\vimrc$': {'ale_enabled': 0}
  }

# coc
autocmd vimRc VimEnter * ++once packadd coc.nvim
g:coc_global_extensions = [
  'coc-json',
  'coc-snippets',
  'coc-tsserver',
  'coc-html',
  'coc-html-css-support',
  'coc-yaml',
  'coc-git',
  ]

g:coc_user_config = {}
g:coc_user_config['languageserver'] = {}
g:coc_user_config['diagnostic.displayByAle'] = v:true
g:coc_user_config['diagnostic.floatConfig'] = {'highlight': 'Normal'}
g:coc_user_config['diagnostic.signPriority'] = 20
g:coc_user_config['diagnostic.errorSign'] = ''
g:coc_user_config['diagnostic.warningSign'] = ''
g:coc_user_config['diagnostic.infoSign'] = ''
g:coc_user_config['diagnostic.hintSign'] = ''
g:coc_user_config['snippets.ultisnips.enable'] = v:false
g:coc_user_config['snippets.userSnippetsDirectory'] = '~/.vim/snippets'
g:coc_user_config['html.filetypes'] = ['html', 'javascript']
g:coc_user_config['html-css-support.enabledLanguages'] = ['html', 'javascript']

autocmd FileType javascript,typescript,nix,vim {
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gr <Plug>(coc-references)
  nmap <leader>a :CocAction<cr>
  nmap <leader>l :CocDiagnostics<cr>
  nmap <silent> K :call CocActionAsync('doHover')<CR>
  }

command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><CR> pumvisible() ? "\<C-Y>" : "\<CR>"
imap <C-f> <Plug>(coc-snippets-expand-jump)
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
nmap gs <Plug>(coc-git-chunkinfo)
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)
nnoremap ghr :CocCommand git.chunkUndo<cr>
nnoremap ghs :CocCommand git.chunkStage<cr>
nnoremap ghu :CocCommand git.chunkUnstage<cr>
nnoremap ghp :CocCommand git.chunkInfo<cr>

# lit
g:htl_all_templates = 1

# autoformat
autocmd vimRc BufRead * ++once packadd vim-autoformat
g:formatters_javascript = ['prettier', 'eslint_local']
g:run_all_formatters_javascript = 1
cabbrev af Autoformat
# extraformat
nnoremap gp :silent %!prettier --stdin-filepath %<CR>

# traces
autocmd vimRc CmdlineEnter * ++once packadd traces.vim
g:traces_num_range_preview = 1

# asterisk
autocmd vimRc BufRead * ++once packadd vim-asterisk
# nmap *  <Plug>(asterisk-z*)
# vmap *  <Plug>(asterisk-z*)

# searchhi
autocmd vimRc BufRead * ++once packadd vim-searchhi
g:searchhi_clear_all_asap = 1
nmap n <Plug>(searchhi-n)
nmap N <Plug>(searchhi-N)
map * <Plug>(asterisk-z*)<Plug>(searchhi-update)
map # <Plug>(asterisk-z#)<Plug>(searchhi-update)
map g* <Plug>(asterisk-zg*)<Plug>(searchhi-update)
map g# <Plug>(asterisk-zg#)<Plug>(searchhi-update)

# metarepeat
autocmd vimRc BufRead * ++once packadd vim-metarepeat

# cmdline completion
autocmd vimRc CmdlineEnter * ++once packadd cmdline-completion

# fugitive
autocmd vimRc CmdlineEnter * ++once packadd vim-fugitive

# memolist
autocmd vimRc CmdlineEnter * ++once packadd memolist.vim
g:memolist_memo_suffix = 'md'
g:memolist_fzf = 1

# undotree
autocmd vimRc CmdlineEnter * ++once packadd undotree
g:undotree_WindowLayout = 4
g:undotree_SetFocusWhenToggle = 1
g:undotree_ShortIndicators = 1

# quickpeek
packadd! quickpeek.vim
autocmd vimRc Filetype qf nnoremap <buffer> <tab> :QuickpeekToggle<cr>

# floaterm
autocmd vimRc BufRead * ++once packadd vim-floaterm
g:floaterm_height = 0.9
g:floaterm_width = 0.9
g:floaterm_autoclose = 2
g:floaterm_keymap_toggle = '<C-q>'
tnoremap <c-x> <c-\><c-n>

# targets
autocmd vimRc BufRead * ++once packadd targets.vim
g:targets_nl = 'nN'

# subversive
autocmd vimRc BufRead * ++once packadd vim-subversive
nnoremap <c-n> <plug>(SubversiveSubstituteWordRangeConfirm)
xnoremap <c-n> <plug>(SubversiveSubstituteRangeConfirm)

# sideways
autocmd vimRc BufRead * ++once packadd sideways.vim
nnoremap c, :SidewaysLeft<cr>
nnoremap c. :SidewaysRight<cr>

# tagalong
autocmd vimRc BufReadPre * ++once packadd tagalong.vim
g:tagalong_filetypes = ['html', 'javascript']

# plugins
packadd! vim-editorconfig
autocmd vimRc CmdlineEnter * ++once packadd vim-fugitive
autocmd vimRc BufRead * ++once packadd auto-git-diff
autocmd vimRc BufRead * ++once packadd diffconflicts
autocmd vimRc BufRead * ++once packadd vim-commentary
autocmd vimRc BufRead * ++once packadd vim-surround
autocmd vimRc BufRead * ++once packadd vim-repeat
autocmd vimRc BufRead * ++once packadd vim-exchange
autocmd vimRc BufRead * ++once packadd hlyank.vim
autocmd vimRc BufRead * ++once packadd vim-expandtab
autocmd vimRc BufRead * ++once packadd limelight.vim
nmap gl <Plug>(Limelight)
xmap gl <Plug>(Limelight)

filetype plugin indent on

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
set nowrap
&showbreak = '↳ '
set breakindent
set breakindentopt=sbr
set noshowmode
set matchpairs-=<:>
set nrformats-=octal
set number
set mouse=a ttymouse=sgr
set signcolumn=yes
set splitright splitbelow
set fillchars=vert:│,fold:-,eob:~
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
set listchars=tab:⹃\ ,trail:⋅,nbsp:␣,extends:↦,precedes:↤
autocmd vimRc InsertEnter * set listchars-=trail:⋅
autocmd vimRc InsertLeave * set listchars+=trail:⋅
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
set statusline=
set statusline+=%<%t
set statusline+=\ %#diffdelete#%{&mod?'(⊙_⊙)':''}
set statusline+=%*
set statusline+=\ %h%w%r
set statusline+=%=
set statusline+=%{&ft}
set statusline+=%7c:%l/%L

# mappings
# save
nnoremap <leader><leader> :update<cr>
# repetable dot
nnoremap cn :norm n.<cr>
nnoremap cN :norm N.<cr>
# wrap
noremap j gj
noremap k gk
# redline
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
inoremap <c-a> <Home>
inoremap <c-e> <End>
inoremap <c-k> <esc>lDi
# paragraph
nnoremap } }zz
nnoremap { {zz
# tabs
nnoremap <c-w>t :tabe %<cr><c-o>
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

# autocmds
# keep cursor position
au vimRc BufReadPost * {
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
autocmd vimRc FileType css setlocal iskeyword+=-
autocmd vimRc FileType scss setlocal iskeyword+=@-@
autocmd vimRc FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
autocmd FileType vim       setlocal foldmethod=marker

# functions
# highlight groups
def SynGroup(): void
  var s = synID(line('.'), col('.'), 1)
  echo synIDattr(s, 'name') .. ' -> ' .. synIDattr(synIDtrans(s), 'name')
enddef
command HL call SynGroup()

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

syntax enable
set termguicolors
colorscheme sacredforest

set secure
