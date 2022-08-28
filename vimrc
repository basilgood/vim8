vim9script

augroup vimRc
  autocmd!
augroup END

var startuptime = reltime()
def Start(): void
  startuptime = reltime(startuptime)
  redraw
  echomsg 'startuptime: ' .. reltimestr(startuptime)
enddef
autocmd vimRc VimEnter * ++once Start()

g:loaded_getscriptPlugin = true
g:loaded_logiPat = true
g:loaded_vimballPlugin = true
g:loaded_vimball = true
g:html_indent_style1 = 'inc'

packadd! matchit

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

plug#begin('~/.vim/plugged')

# navigation
g:netrw_list_hide = ',^\.\.\=/\=$'
g:netrw_banner = 0
g:netrw_altfile = 1
g:netrw_preview = 1
g:netrw_alto = 0
g:netrw_use_errorwindow = 0
g:netrw_special_syntax = 1
autocmd vimRc FileType netrw {
  nmap <buffer> <left> -
  nmap <buffer> <right> <cr>
  nmap <buffer> . mfmx
  }
cnoreabbrev <silent> ee e %:h
autocmd vimRc CursorHold * {
  if buffer_name() == $HOME .. '/.vim'
    set ft=netrw
  endif
  }

# Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim', {'on': []}
autocmd vimRc VimEnter * ++once plug#load('fzf.vim')
$FZF_DEFAULT_OPTS = '--layout=reverse --inline-info --tac --ansi --margin 1,4'
$FZF_DEFAULT_COMMAND = 'fd -tf -L -H -E=.git -E=node_modules --strip-cwd-prefix'
g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
g:fzf_preview_window = ['up:85%', 'ctrl-/']
nnoremap <c-p> :Files<cr>
cnoreabbrev fl Files %:p:h
nnoremap <bs> :Buffers<cr>

def RipgrepFzf(query: string)
  final command_fmt = 'rg --column --line-number --no-heading --color=always '
  final initial_command = printf(command_fmt .. shellescape(query))
  final reload_command = printf(command_fmt .. ('%s'), '{q}')
  final spec = {'options': ['--phony', '--query', query, '--bind', 'change:reload:eval ' .. reload_command]}
  fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), 0)
enddef

command! -nargs=* Rg RipgrepFzf(<q-args>)

Plug 'antoinemadec/coc-fzf', {'on': []}
autocmd vimRc VimEnter * ++once plug#load('coc-fzf')
g:coc_fzf_preview = 'up:85%'
g:coc_fzf_preview_toggle_key = 'ctrl-/'
nmap <silent> <leader>a :CocFzfList actions<cr>
nmap <silent> <leader>d :CocFzfList diagnostics  --current-buf<cr>

# complete/lint
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'on': [] }
autocmd vimRc BufReadPre * ++once plug#load('coc.nvim')
g:coc_global_extensions = [
  'coc-coverage',
  'coc-diagnostic',
  'coc-docthis',
  'coc-eslint',
  'coc-git',
  'coc-html',
  'coc-html-css-support',
  'coc-json',
  'coc-markdownlint',
  'coc-snippets',
  'coc-tsserver',
  'coc-vimlsp',
  'coc-yaml',
  ]

autocmd FileType javascript,typescript,nix {
  nmap <silent> gd <cmd>call CocActionAsync('jumpDefinition', v:false)<cr>
  nmap <silent> gr <Plug>(coc-references)
  nmap <silent> K :call CocActionAsync('doHover')<CR>
  }

command! -nargs=0 Action call CocActionAsync('codeAction', '')
command! -nargs=0 Format call CocAction('format')
command! -nargs=0 OrgImp call CocAction('runCommand', 'editor.action.organizeImport')

inoremap <silent><expr> <tab> coc#pum#visible() ? coc#pum#next(1) : '<tab>'
inoremap <expr><s-tab> coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "<CR><c-r>=coc#on_enter()<CR>"
g:coc_snippet_next = '<tab>'
nmap [e <Plug>(coc-diagnostic-prev)
nmap ]e <Plug>(coc-diagnostic-next)
nmap <expr> ]c &diff ? ']c' : '<Plug>(coc-git-nextchunk)'
nmap <expr> [c &diff ? '[c' : '<Plug>(coc-git-prevchunk)'
nnoremap ghu :CocCommand git.chunkUndo<cr>
nnoremap ghs :CocCommand git.chunkStage<cr>
nnoremap ghp :CocCommand git.chunkInfo<cr>
nnoremap ghl :CocCommand git.browserOpen<cr>
nnoremap ghc :CocCommand git.showCommit<cr>
nnoremap ghf :CocCommand git.foldUnchanged<cr>
nnoremap ghb :echo b:coc_git_blame<cr>

# formatter
Plug 'vim-autoformat/vim-autoformat', {'on': 'Autoformat'}
g:formatters_javascript = ['prettier']
g:formatdef_custom_nix = '"nixpkgs-fmt"'
g:formatters_nix = ['custom_nix']
cabbrev af Autoformat

# langs
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
Plug 'LnL7/vim-nix', {'for': 'nix'}

# editorconfig
Plug 'sgur/vim-editorconfig', {'on': []}
autocmd vimRc BufReadPre * ++once plug#load('vim-editorconfig')

# terminal
Plug 'voldikss/vim-floaterm', {'on': []}
autocmd vimRc BufReadPre * ++once plug#load('vim-floaterm')
g:floaterm_height = 0.9
g:floaterm_width = 0.9
g:floaterm_autoclose = 2
g:floaterm_keymap_toggle = '<C-@>'

# misc
Plug 'fcpg/vim-altscreen'
Plug 'tpope/vim-commentary', {'on': []}
autocmd vimRc BufReadPre * ++once plug#load('vim-commentary')
Plug 'tpope/vim-surround', {'on': []}
autocmd vimRc BufReadPre * ++once plug#load('vim-surround')
Plug 'tpope/vim-repeat', {'on': []}
autocmd vimRc BufReadPre * ++once plug#load('vim-repeat')
Plug 'basilgood/hlyank.vim', {'on': []}
autocmd vimRc BufReadPre * ++once plug#load('hlyank.vim')
Plug 'tommcdo/vim-exchange', {'on': []}
autocmd vimRc BufReadPre * ++once plug#load('vim-exchange')
Plug 'haya14busa/vim-asterisk', {'on': []}
autocmd vimRc BufReadPre * ++once plug#load('vim-asterisk')
nmap *  <Plug>(asterisk-z*)
vmap *  <Plug>(asterisk-z*)

Plug 'markonm/traces.vim', {'on': []}
autocmd vimRc CmdlineEnter * ++once plug#load('traces.vim')
Plug 'stefandtw/quickfix-reflector.vim', {'for': 'qf'}
Plug 'AndrewRadev/quickpeek.vim', {'for': 'qf'}
autocmd vimRc Filetype qf nnoremap <buffer> <tab> :QuickpeekToggle<cr>

Plug 'toombs-caeman/vim-smoothie', {'on': []}
autocmd vimRc BufReadPre * ++once plug#load('vim-smoothie')
g:smoothie_remapped_commands = [
  '<C-D>', '<C-U>', '<C-F>', '<C-B>',
  '<S-Down>', '<PageDown>', '<S-Up>', '<PageUp>',
  'z+', 'z^', 'zt', 'z<CR>',
  'z.', 'zz', 'z-', 'zb',
  'gg', 'G', 'n', 'N', '{', '}', '``'
  ]

# git
Plug 'tpope/vim-fugitive', {'on': []}
autocmd vimRc CmdlineEnter,BufRead * ++once plug#load('vim-fugitive')
cabbrev gl tab G log --all --graph --oneline --decorate
cabbrev gs tab G
cabbrev gb tab G branch
cabbrev gp G push
cabbrev gpf G push -f
cabbrev gf G fetch --all --prune
autocmd vimRc FileType git {
  nmap <buffer> gl :q<cr>:gl<cr>
  nmap <buffer> gb :q<cr>:gb<cr>
  nmap <buffer> gs :q<cr>:gs<cr>
  }
autocmd vimRc FileType fugitive {
  nmap <buffer> gl gq:gl<cr>
  nmap <buffer> gb gq:gb<cr>
  }
def ConflictsHighlight()
  syn match oursMarker "^\(<<<<<<<.*\)$"
  syn match ancestorMarker "^\(|||||||.*\)$"
  syn match theirsMarker "^\(>>>>>>>.*\)$"
  hi! oursMarker guibg=#1b3218
  hi! ancestorMarker guibg=#1c1c1c
  hi! theirsMarker guibg=#182832
enddef
command! CH ConflictsHighlight()

# theme
Plug 'basilgood/ayu-vim'

plug#end()

# options
&t_EI ..= "\e[2 q"
&t_SR ..= "\e[4 q"
&t_SI ..= "\e[6 q"
set t_ut=
set t_md=
set path=.,**
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
set fillchars=diff:\ ,vert:│
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
set pumheight=10
set diffopt+=context:3,indent-heuristic,algorithm:patience
set list
set listchars=tab:🢭\ ,trail:·,nbsp:␣,extends:❯,precedes:❮
autocmd vimRc InsertEnter * set listchars-=trail:⋅
autocmd vimRc InsertLeave * set listchars+=trail:⋅
set shortmess=asOIc
set confirm
set wildmenu
set wildmode=longest:full,full
set wildoptions=pum
set wildignorecase
set wildcharm=<C-Z>
&grepprg = 'grep -rnHI'
set backspace=indent,eol,start
&laststatus = 2
set statusline=%<%{bufname('%')}%h%w%r%m%=%{&ft}%5c:%l/%L

# mappings
nnoremap <silent> <c-w>d :bp<bar>bd#<cr>
nnoremap <silent> <C-w>z :wincmd z<Bar>cclose<Bar>lclose<CR>
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
nnoremap vv viw
xnoremap il g_o^
vnoremap . :normal .<CR>
nnoremap <silent> 3<C-g> :echon system('cat .git/HEAD')->split('\n')<CR>
nnoremap <silent> <C-l> :noh<bar>diffupdate<bar>syntax sync fromstart<cr><c-l>
nnoremap [q :cprev<cr>
nnoremap ]q :cnext<cr>

# autocmds
# keep cursor position
au vimRc BufReadPost * {
  if line("'\"") > 1 && line("'\"") <= line("$") && &filetype != 'gitcommit'
    exe 'normal! g`"'
  endif
  }

# qf widow full width
autocmd vimRc FileType qf wincmd J

# update diff
autocmd vimRc InsertLeave * {
  if &diff
    diffupdate
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
autocmd vimRc BufReadPre *.md,*.markdown setlocal conceallevel=2 concealcursor=n
autocmd vimRc FileType javascript setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd vimRc BufNewFile,BufRead *.gitignore setfiletype gitignore
autocmd vimRc BufNewFile,BufRead config      setfiletype config
autocmd vimRc BufNewFile,BufRead *.lock      setfiletype config
autocmd vimRc BufNewFile,BufRead .babelrc    setfiletype json
autocmd vimRc BufNewFile,BufRead *.txt       setfiletype markdown
autocmd vimRc BufReadPre *.json  setlocal conceallevel=0 concealcursor=
autocmd vimRc BufReadPre *.json  setlocal formatoptions=
autocmd vimRc BufNewFile,BufRead *.html,*.javascript  setlocal matchpairs-=<:>

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

# colorscheme
set termguicolors
syntax enable
colorscheme ayu

set secure
