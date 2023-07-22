vim9script

runtime defaults.vim
packadd matchit

augroup vimRc
  autocmd!
augroup END

if has('vim_starting')
  const minpac_dir = $HOME .. '/.vim/pack/minpac/opt/minpac'
  if !isdirectory(minpac_dir)
    silent execute '!git clone --depth 1 https://github.com/k-takata/minpac ' .. minpac_dir
  endif
endif

command! PackUpdate PackInit() | minpac#update()
command! PackClean  PackInit() | minpac#clean()
command! -nargs=+ Pack minpac#add(<args>)

def PackInit()
  packadd minpac
  call minpac#init()
  Pack 'k-takata/minpac', {'type': 'opt'}
  Pack 'sgur/vim-editorconfig'
  Pack 'junegunn/fzf'
  Pack 'junegunn/fzf.vim', {'type': 'opt'}
  Pack 'yegappan/lsp', {'type': 'opt'}
  Pack 'dense-analysis/ale', {'type': 'opt'}
  Pack 'rstacruz/vim-closer'
  Pack 'thezeroalpha/vim-relatively-complete'
  Pack 'pangloss/vim-javascript'
  Pack 'jonsmithers/vim-html-template-literals'
  Pack 'HerringtonDarkholme/yats.vim'
  Pack 'tpope/vim-commentary'
  Pack 'tpope/vim-surround'
  Pack 'tpope/vim-repeat'
  Pack 'ubaldot/vim-highlight-yanked'
  Pack 'linjiX/vim-star'
  Pack 'markonm/traces.vim'
  Pack 'sgur/cmdline-completion'
  Pack 'fcpg/vim-altscreen'
  Pack 'stefandtw/quickfix-reflector.vim'
  Pack 'AndrewRadev/quickpeek.vim'
  Pack 'tpope/vim-fugitive'
  Pack 'airblade/vim-gitgutter'
  Pack 'Eliot00/git-lens.vim'
  Pack 'basilgood/vim-options'
  Pack 'sainnhe/everforest', {'type': 'opt'}
enddef

# fzf
silent! packadd fzf.vim
$FZF_DEFAULT_COMMAND = 'fd -tf -L -H -E=.git -E=node_modules --strip-cwd-prefix'
g:fzf_layout = {'window': {'width': 0.7, 'height': 0.8, 'border': 'sharp'}}
g:fzf_preview_window = ['up:70%', 'ctrl-/']
nnoremap <c-p> :Files<cr>
cabbrev ff Files %:p:h
nnoremap <bs> :Buffers<cr>

# lsp
silent! packadd lsp
var lspServers = [
  {
    name: 'tsserver',
    filetype: ['javascript', 'typescript'],
    path: 'typescript-language-server',
    args: ['--stdio'],
  },
  {
    name: 'vimls',
    filetype: ['vim'],
    path: 'vim-language-server',
    args: ['--stdio']
  },
  {
    name: 'rust-analyzer',
    filetype: ['rust'],
    path: 'rust-analyzer',
    args: [],
    syncInit: true,
  },
]
silent! call LspOptionsSet({
  aleSupport: true,
  noNewlineInCompletion: true,
  showDiagInPopup: false,
  echoSignature: true,
  usePopupInCodeAction: true,
})
silent! call LspAddServer(lspServers)

def OnLspAttach()
  nnoremap <buffer> gd   <cmd>LspGotoDefinition<CR>
  nnoremap <buffer> gD   <cmd>LspPeekDefinition<CR>
  nnoremap <buffer> gr   <cmd>LspReferences<CR>
  nnoremap <buffer> K    <cmd>LspHover<CR>
  nnoremap <buffer> <F2> <cmd>LspRename<CR>
  nnoremap <buffer> <F4> <cmd>LspCodeAction<CR>
enddef
autocmd User LspAttached OnLspAttach()

inoremap <silent><expr> <tab> pumvisible() ? '<c-n>' : '<tab>'
inoremap <expr><s-tab> pumvisible() ? '<c-p>' : '<c-h>'
inoremap <expr> <cr> pumvisible() ? '<c-y>' : '<cr>'

# ale
silent! packadd ale
g:ale_disable_lsp = 1
g:ale_virtualtext_cursor = 0
g:ale_sign_error = '▸▸'
g:ale_sign_warning = '▸ '
g:ale_sign_info = '▸ '
g:ale_echo_msg_error_str = 'E'
g:ale_echo_msg_warning_str = 'W'
g:ale_echo_msg_info_str = 'I'
g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
g:ale_sh_shfmt_options = '-i 2 -ci -sr'
g:ale_fixers = {
  sh: ['shfmt'],
  javascript: ['prettier'],
  typescript: ['prettier'],
  html: ['prettier'],
  css: ['prettier'],
  json: ['fixjson'],
  nix: ['alejandra'],
  yaml: ['yamlfix'],
  rust: ['rustfmt'],
}

nnoremap ]d <Plug>(ale_next_wrap)
nnoremap [d <Plug>(ale_previous_wrap)
nnoremap Q :ALEFix<cr>

# toggle autoformat
def g:ToggleAutoFormat()
  echo 'autoformat ' .. !g:ale_fix_on_save
  g:ale_fix_on_save = !g:ale_fix_on_save
enddef
nnoremap <silent><leader>f <cmd>call ToggleAutoFormat()<cr>

# git
g:gitgutter_sign_priority = 8
g:gitgutter_preview_win_floating = 1
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
nnoremap ghd :Gvdiffsplit!<cr>
nnoremap <silent> ghb :call ToggleGitLens()<cr>

# lit
g:html_indent_style1 = 'inc'
g:htl_css_templates = 1
g:htl_all_templates = 1

# star
vmap <silent> * <Plug>(star-*)
nmap <silent> * <Plug>(star-*)
nnoremap <silent> gs <Plug>(star-*)cgn
xnoremap <silent> gs <Plug>(star-*)cgn

# traces
g:traces_normal_preview = 1
g:traces_num_range_preview = 1

# quickpeek
g:quickpeek_popup_options = {
  borderchars: ['-', '|', '-', '|', '+', '+', '+', '+'],
}
g:quickpeek_window_settings = ['cursorline', 'number']
autocmd vimRc Filetype qf nnoremap <buffer> <tab> :QuickpeekToggle<cr>

filetype plugin indent on

# colorscheme
silent! packadd! everforest
set background=dark
g:everforest_disable_italic_comment = 1
autocmd vimRc ColorScheme everforest {
  hi DiffDelete guifg=#514045 guibg=#232326
  hi DiffText guibg=#444444 guifg=NONE
  hi DiffChange guibg=#232326
  hi DiffAdd ctermbg=234 guibg=#232326
}
colorscheme everforest

set secure
