vim9script
runtime defaults.vim

augroup vimRc
  autocmd!
augroup END

packadd! matchit

const minpac_dir = '~/.vim/pack/minpac/opt/minpac'
if !isdirectory(expand(minpac_dir))
  echo "Install minpac ..."
  execute 'silent! !git clone --depth 1 https://github.com/k-takata/minpac ' .. minpac_dir
endif

def PackInit()
  packadd minpac
  minpac#init()
  minpac#add('k-takata/minpac', {'type': 'opt'})
  minpac#add('junegunn/fzf.vim')
  minpac#add('prabirshrestha/asyncomplete.vim')
  minpac#add('prabirshrestha/asyncomplete-lsp.vim')
  minpac#add('prabirshrestha/vim-lsp')
  minpac#add('mattn/vim-lsp-settings')
  minpac#add('tpope/vim-fugitive')
  minpac#add('airblade/vim-gitgutter')
  minpac#add('maxmellon/vim-jsx-pretty')
  minpac#add('yuezk/vim-js')
  minpac#add('LnL7/vim-nix')
  minpac#add('basilgood/istanbul.vim')
  minpac#add('sgur/vim-editorconfig')
  minpac#add('tpope/vim-commentary')
  minpac#add('tpope/vim-surround')
  minpac#add('tpope/vim-repeat')
  minpac#add('basilgood/hlyank.vim')
  minpac#add('tommcdo/vim-exchange')
  minpac#add('linjiX/vim-star')
  minpac#add('markonm/traces.vim')
  minpac#add('fcpg/vim-altscreen')
  minpac#add('sgur/cmdline-completion')
  minpac#add('stefandtw/quickfix-reflector.vim')
  minpac#add('AndrewRadev/quickpeek.vim')
  minpac#add('toombs-caeman/vim-smoothie')
  minpac#add('basilgood/night-owl.vim', {'type': 'opt'})
enddef

command! PackUpdate PackInit() | minpac#update()
command! PackClean  PackInit() | minpac#clean()
command! PackStatus packadd minpac | minpac#status()

filetype plugin indent on

# netrw
g:netrw_list_hide = ',^\./$'
g:netrw_banner = 0
g:netrw_preview = 1
g:netrw_alto = 'spr'
g:netrw_use_errorwindow = 0
g:netrw_special_syntax = 1

autocmd vimRc FileType netrw nmap <buffer> . mfmx
autocmd vimRc CursorHold * {
  if buffer_name() == $HOME .. '/.vim'
    set ft=netrw
  endif
}

def Ls(): void
  var file = expand('%:t')
  execute 'Explore' expand('%:h')
  search(file, 'wc')
enddef

command Ex Ls()
cnoreabbrev <silent> ee Ex

# fzf
$FZF_DEFAULT_COMMAND = 'fd -tf -L -H -E=.git -E=node_modules --strip-cwd-prefix'
g:fzf_layout = {'window': {'width': 1, 'height': 1, 'border': 'none'}}
g:fzf_preview_window = ['up:75%:border-horizontal']
nnoremap <c-p> :Files<cr>
cnoreabbrev ff Files %:p:h
cnoreabbrev note Files ~/Notes
nnoremap <bs> :Buffers<cr>

def RipgrepFzf(query: string): void
  final command_fmt = 'rg --column --line-number --no-heading --color=always '
  final initial_command = printf(command_fmt .. shellescape(query))
  final reload_command = printf(command_fmt .. ('%s'), '{q}')
  final spec = {'options': ['--phony', '--query', query, '--bind', 'change:reload:eval ' .. reload_command]}
  fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), 0)
enddef

command! -nargs=* Rg RipgrepFzf(<q-args>)

# lsp
g:lsp_use_native_client = 1
g:lsp_preview_float = 1
g:lsp_diagnostics_echo_cursor = 1
g:lsp_diagnostics_highlights_enabled = 0
g:lsp_document_highlight_enabled = 0
g:lsp_format_sync_timeout = 1000
g:lsp_documentation_float_docked = 1
g:lsp_semantic_enabled = 1
g:lsp_settings = {
  'efm-langserver': {
    'disabled': 0,
    'args': ['-c=' .. expand('~/.vim/efm-langserver/config.yaml')],
  },
}

def OnLspBufferEnabled()
  setlocal omnifunc=lsp#complete
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gD <plug>(lsp-peek-definition)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> K <plug>(lsp-hover-float)
  nmap <buffer> <c-k> <plug>(lsp-signature-help)
  nmap <buffer> [e <Plug>(lsp-previous-diagnostic)
  nmap <buffer> ]e <Plug>(lsp-next-diagnostic)
  inoremap <buffer> <expr><c-u> lsp#scroll(+4)
  inoremap <buffer> <expr><c-d> lsp#scroll(-4)
  nmap <buffer> <leader>a <plug>(lsp-code-action-float)
  nmap <buffer> <leader>d <plug>(lsp-document-diagnostics)
  g:lsp_format_sync_timeout = 1000
  nnoremap <buffer> gQ :LspDocumentFormatSync --server=efm-langserver<CR>
  cabbrev fm LspDocumentFormatSync --server=efm-langserver
enddef

autocmd vimRc User lsp_buffer_enabled OnLspBufferEnabled()

# asyncomplete
g:asyncomplete_popup_delay = 300
set complete-=t
inoremap <silent><expr> <TAB> pumvisible() ? '<C-n>' : '<TAB>'
inoremap <expr><S-TAB> pumvisible() ? '<C-p>' : '<C-h>'

# fugitive
cabbrev gl tab G log --all --graph --oneline --decorate
cabbrev gs tab G
cabbrev gb tab G branch
cabbrev gp G push
cabbrev gpf G push -f
autocmd vimRc FileType git {
  nmap <buffer> gl :q<cr>:gl<cr>
  nmap <buffer> gb :q<cr>:gb<cr>
  nmap <buffer> gs :q<cr>:gs<cr>
}
autocmd vimRc FileType fugitive {
  nmap <buffer> gl gq:gl<cr>
  nmap <buffer> gb gq:gb<cr>
}

# jsx
g:vim_jsx_pretty_template_tags = ['html', 'js', 'ts']

# star
vmap <silent> * <Plug>(star-*)
nmap <silent> * <Plug>(star-*)

# quickpeek
g:quickpeek_popup_options = {
  borderchars: ['-', '|', '-', '|', '+', '+', '+', '+'],
  highlight: 'Normal'
}
g:quickpeek_window_settings = ['cursorline', 'number']
autocmd vimRc Filetype qf nnoremap <buffer> <tab> :QuickpeekToggle<cr>

# smoothie
g:smoothie_remapped_commands = [
  '<C-D>', '<C-U>', '<C-F>', '<C-B>',
  '<S-Down>', '<PageDown>', '<S-Up>', '<PageUp>',
  'z+', 'z^', 'zt', 'z<CR>',
  'z.', 'zz', 'z-', 'zb',
  'gg', 'G', 'n', 'N', '{', '}', '``'
]

# traces
g:traces_num_range_preview = 1

# istanbul
g:istanbul#jsonPath = ['.tmp/coverage/coverage-final.json']

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
set splitright splitbelow virtualedit=onemore
set nowrap nostartofline noshowmode hlsearch
set sidescrolloff=5 sidescroll=1
set sessionoptions=buffers,curdir,folds,tabpages,winsize
set lazyredraw timeoutlen=3000 updatetime=100
set diffopt+=context:3,indent-heuristic,algorithm:patience
set list
set listchars=tab:▸\ ,trail:·,nbsp:␣,extends:❯,precedes:❮
autocmd vimRc InsertEnter * set listchars-=trail:⋅
autocmd vimRc InsertLeave * set listchars+=trail:⋅
set shortmess=aAIoOsc
set pumheight=10
set wildmode=longest:full,full
set wildoptions=pum
set wildignorecase
if executable('rg')
  set grepprg=rg\ --vimgrep
else
  set grepprg=grep\ -rnHI
endif
set laststatus=2
set statusline=%{pathshorten(expand('%'))}%h%r%#error#%m%*%=%{&ft}%4c:%l/%L

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
nnoremap <leader>y "+y
xnoremap <leader>y "+y

# autocmds
# qf and help widows full width
autocmd vimRc FileType qf,help wincmd J

# update diff
autocmd vimRc InsertLeave * {
  if &diff
    diffupdate
  endif
  }

# mkdir
autocmd vimRc BufWritePre * {
  if !isdirectory(expand('%:h', v:true))
    mkdir(expand('%:h', v:true), 'p')
  endif
  }

# filetypes
autocmd vimRc BufNewFile,BufReadPost *.md,*.markdown setlocal conceallevel=2 concealcursor=n
autocmd vimRc BufNewFile,BufReadPost *.gitignore setfiletype gitignore
autocmd vimRc BufNewFile,BufReadPost config      setfiletype config
autocmd vimRc BufNewFile,BufReadPost *.lock      setfiletype config
autocmd vimRc BufNewFile,BufReadPost .babelrc    setfiletype json
autocmd vimRc BufNewFile,BufReadPost *.txt       setfiletype markdown
autocmd vimRc BufNewFile,BufReadPost *.json  setlocal conceallevel=0 concealcursor=
autocmd vimRc BufNewFile,BufReadPost *.json  setlocal formatoptions=
autocmd vimRc BufNewFile,BufReadPost *.html,*.javascript  setlocal matchpairs-=<:>

# highlight groups
def SynGroup(): void
  const s = synID(line('.'), col('.'), 1)
  echo synIDattr(s, 'name') .. ' -> ' .. synIDattr(synIDtrans(s), 'name')
enddef
command HL SynGroup()

# sessions
const session_path = expand('~/.cache/vim/sessions/')
if !isdirectory(session_path)
  mkdir(session_path, 'p')
endif
autocmd! vimRc VimLeavePre * {
  execute 'mksession! ' .. session_path .. split(getcwd(), '/')[-1]
  }
command! -nargs=0 SS {
  execute 'source ' .. session_path .. split(getcwd(), '/')[-1]
  }
nnoremap <leader>s :SS<cr>

# colorscheme
set termguicolors
colo night-owl

set secure
