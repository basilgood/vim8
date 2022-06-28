vim9script

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

# navigation
minpac#add('tpope/vim-vinegar', {'type': 'opt'})
minpac#add('junegunn/fzf', {'type': 'opt'})
minpac#add('junegunn/fzf.vim', {'type': 'opt'})

# lsp
minpac#add('neoclide/coc.nvim', {'branch': 'release', 'type': 'opt'})

# lint and format
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
minpac#add('tommcdo/vim-exchange', {'type': 'opt'})
minpac#add('haya14busa/vim-asterisk', {'test': 'opt'})
minpac#add('markonm/traces.vim', {'type': 'opt'})
minpac#add('stefandtw/quickfix-reflector.vim')
minpac#add('blueyed/vim-qf_resize')
minpac#add('basilgood/hlyank.vim', { 'type': 'opt' })
minpac#add('AndrewRadev/quickpeek.vim', {'type': 'opt'})
minpac#add('voldikss/vim-floaterm', {'type': 'opt'})
minpac#add('romainl/vim-cool', {'type': 'opt'})
minpac#add('fcpg/vim-altscreen')
minpac#add('toombs-caeman/vim-smoothie', {'type': 'opt'})
minpac#add('itchyny/lightline.vim', {'type': 'opt'})

# git
minpac#add('tpope/vim-fugitive', {'type': 'opt'})
minpac#add('whiteinge/diffconflicts', {'type': 'opt'})

command! PackUpdate minpac#update()
command! PackClean minpac#clean()
command! PackStatus minpac#status()

# packs configs
# netrw
g:netrw_altfile = 1
g:netrw_preview = 1
g:netrw_alto = 0
g:netrw_use_errorwindow = 0
autocmd vimRc FileType netrw {
  nmap <buffer> <left> -
  nmap <buffer> <right> <cr>
  }
autocmd vimRc VimEnter * ++once packadd vim-vinegar

# fzf
autocmd vimRc VimEnter * ++once packadd fzf
autocmd vimRc VimEnter * ++once packadd fzf.vim
$FZF_DEFAULT_OPTS = '--layout=reverse --inline-info --tac --ansi --margin 1,4'
$FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --color=always --exclude .git'
g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.9 } }
g:fzf_preview_window = ['up:75%', 'ctrl-/']
nnoremap <c-p> :Files<cr>
nnoremap <bs> :Buffers<cr>
cnoreabbrev fl Files %:p:h

# coc
autocmd vimRc VimEnter * ++once packadd coc.nvim
g:coc_global_extensions = [
  'coc-json',
  'coc-snippets',
  'coc-tsserver',
  'coc-eslint',
  'coc-prettier',
  'coc-html',
  'coc-html-css-support',
  'coc-vimlsp',
  'coc-git',
  ]

autocmd FileType javascript,typescript,nix,vim {
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gr <Plug>(coc-references)
  nmap <silent> K :call CocActionAsync('doHover')<CR>
  }

command! -nargs=0 Action call CocActionAsync('codeAction', '')
command! -nargs=0 Format call CocAction('format')
command! -nargs=0 OrgImp call CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=0 Prettier CocCommand prettier.forceFormatDocument

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? "\<C-Y>" : "\<CR>"
imap <C-f> <Plug>(coc-snippets-expand-jump)
nmap [e <Plug>(coc-diagnostic-prev)
nmap ]e <Plug>(coc-diagnostic-next)
nmap [g <Plug>(coc-git-prevconflict)
nmap ]g <Plug>(coc-git-nextconflict)
nmap <expr> ]c &diff ? ']c' : '<Plug>(coc-git-nextchunk)'
nmap <expr> [c &diff ? '[c' : '<Plug>(coc-git-prevchunk)'
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)
nnoremap ghr :CocCommand git.chunkUndo<cr>
nnoremap ghs :CocCommand git.chunkStage<cr>
nnoremap ghu :CocCommand git.chunkUnstage<cr>
nnoremap ghp :CocCommand git.chunkInfo<cr>
nnoremap ghb :CocCommand git.browserOpen<cr>
nnoremap ghc :CocCommand git.showCommit<cr>
nnoremap ghf :CocCommand git.foldUnchanged<cr>
nnoremap ghg :echo b:coc_git_blame<cr>

# lit
g:htl_all_templates = 1

# autoformat
autocmd vimRc BufRead * ++once packadd vim-autoformat
g:formatters_javascript = ['prettier']
g:formatdef_custom_nix = '"nixpkgs-fmt"'
g:formatters_nix = ['custom_nix']
cabbrev af Autoformat

# traces
autocmd vimRc CmdlineEnter * ++once packadd traces.vim
g:traces_num_range_preview = 1

# asterisk
autocmd vimRc BufRead * ++once packadd vim-asterisk
nmap *  <Plug>(asterisk-z*)
vmap *  <Plug>(asterisk-z*)

# fugitive
autocmd vimRc CmdlineEnter * ++once packadd vim-fugitive
autocmd FileType fugitive nmap <buffer> <tab> dv:wincmd w<cr>

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

# smoothie
autocmd vimRc BufRead * ++once packadd vim-smoothie
g:smoothie_experimental_mappings = v:true
nnoremap } }zz
nnoremap { {zz

# exchange
autocmd vimRc BufRead * ++once packadd vim-exchange
nmap c. cxiw

# lightline
autocmd vimRc BufRead * ++once packadd lightline.vim
g:lightline = {
  'colorscheme': 'wombat',
  'active': {
    'left': [['paste'],
    ['readonly', 'filename', 'modified']],
    'right': [['lineinfo'], ['filetype']]
    },
  'inactive': {
    'left': [['paste'],
    ['readonly', 'filename', 'modified']],
    'right': [['lineinfo'], ['filetype']]
    },
  'component': {
    'lineinfo': '%4c:%l/%L'
    },
  'separator': { 'left': "", 'right': "\ue0be" },
  'subseparator': { 'left': "", 'right': "\ue0b9" },
  'tabline_separator': { 'left': "", 'right': "\ue0be" },
  'tabline_subseparator': { 'left': "", 'right': "\ue0b9" }
  }

# event loaded packs
packadd! vim-editorconfig
autocmd vimRc CmdlineEnter * ++once packadd vim-fugitive
autocmd vimRc BufRead * ++once packadd diffconflicts
autocmd vimRc BufRead * ++once packadd vim-commentary
autocmd vimRc BufRead * ++once packadd vim-surround
autocmd vimRc BufRead * ++once packadd vim-repeat
autocmd vimRc BufRead * ++once packadd vim-cool
autocmd vimRc BufRead * ++once packadd hlyank.vim
autocmd vimRc FileType qf ++once packadd cfilter

filetype plugin indent on

# options
&t_EI ..= "\e[2 q"
&t_SR ..= "\e[4 q"
&t_SI ..= "\e[6 q"
set t_ut=
set t_md=
set path=.,,tests/**
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
set fillchars=vert:│,fold:-,diff:\ ,eob:~
set virtualedit=onemore
set sidescrolloff=10 sidescroll=1
set sessionoptions-=options
set sessionoptions-=blank
set sessionoptions-=help
set lazyredraw
set timeoutlen=3000
set ttimeoutlen=50
set updatetime=150
set incsearch hlsearch
set completeopt+=noselect,noinsert
set pumheight=10
set diffopt+=context:3,indent-heuristic,algorithm:patience
set list
set listchars=tab:▫\ ,trail:·,nbsp:␣,extends:❯,precedes:❮
autocmd vimRc InsertEnter * set listchars-=trail:⋅
autocmd vimRc InsertLeave * set listchars+=trail:⋅
set shortmess=
set shortmess+=asoOtIcF
set confirm
set history=1000
set viminfo^=!
set wildmenu
set wildmode=longest:full,full
set wildoptions=tagfile,pum
set wildignorecase
set wildcharm=<C-Z>
&grepprg = 'grep -rnH'
&grepformat = '%f:%l:%c:%m,%f:%l:%m'
&errorformat ..= ',%f\|%\s%#%l col%\s%#%c%\s%#\| %m'
set backspace=indent,eol,start
&laststatus = 2
set statusline=
set statusline+=%<%t
set statusline+=\ %h%w%r%m
set statusline+=%=
set statusline+=\ %{&ft}
set statusline+=%7c:%l/%L

# mappings
# save
nnoremap <leader><leader> :update<cr>
# bufdelete
nnoremap <silent> <c-w>d :bp<bar>bd#<cr>
# close qf
nnoremap <silent> <C-w>z :wincmd z<Bar>cclose<Bar>lclose<CR>
# wrap true
noremap j gj
noremap k gk
# redline
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
inoremap <c-a> <Home>
inoremap <c-e> <End>
inoremap <c-k> <esc>lDi
# objects
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<cr>
xnoremap <silent> ie gg0oG$
onoremap <silent> ie :<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<cr>
nnoremap vv viw
# substitute
xnoremap s :s/
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

set termguicolors
syntax enable
colorscheme gruvbox8

set secure
