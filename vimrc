vim9script

augroup vimRc
  autocmd!
augroup END

# unload some plugins
g:loaded_getscriptPlugin = true
g:loaded_logiPat = true
g:loaded_vimballPlugin = true
g:loaded_vimball = true
g:html_indent_style1 = 'inc'

# load matchit
packadd! matchit

# install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

# plugins
plug#begin('~/.vim/plugged')
# Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-autoformat/vim-autoformat', {'on': 'Autoformat'}
Plug 'tpope/vim-fugitive'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
Plug 'LnL7/vim-nix', {'for': 'nix'}
Plug 'sgur/vim-editorconfig'
Plug 'voldikss/vim-floaterm'
Plug 'fcpg/vim-altscreen'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'basilgood/hlyank.vim'
Plug 'tommcdo/vim-exchange'
Plug 'linjiX/vim-star', {'on': '<Plug>(star-'}
Plug 'markonm/traces.vim'
Plug 'sgur/cmdline-completion'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'AndrewRadev/quickpeek.vim'
Plug 'toombs-caeman/vim-smoothie'
Plug 'basilgood/vim-options'
plug#end()

# pluggins configs
# netrw
g:netrw_list_hide = '^./$'
g:netrw_banner = 0
g:netrw_altfile = 1
g:netrw_preview = 1
g:netrw_alto = 0
g:netrw_use_errorwindow = 0
g:netrw_special_syntax = 1
autocmd vimRc FileType netrw {
  nmap <buffer> . mfmx
}
cnoreabbrev <silent> ee e %:h
autocmd vimRc CursorHold * {
  if buffer_name() == $HOME .. '/.vim'
    set ft=netrw
  endif
}

# fzf
$FZF_DEFAULT_COMMAND = 'fd -tf -L -H -E=.git -E=node_modules --strip-cwd-prefix'
g:fzf_layout = {'window': {'width': 1, 'height': 1, 'border': 'sharp'}}
g:fzf_preview_window = ['up:85%', 'ctrl-/']
nnoremap <c-p> :Files<cr>
cnoreabbrev ff Files %:p:h
nnoremap <bs> :Buffers<cr>

def RipgrepFzf(query: string)
  final command_fmt = 'rg --column --line-number --no-heading --color=always '
  final initial_command = printf(command_fmt .. shellescape(query))
  final reload_command = printf(command_fmt .. ('%s'), '{q}')
  final spec = {'options': ['--phony', '--query', query, '--bind', 'change:reload:eval ' .. reload_command]}
  fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), 0)
enddef

command! -nargs=* Rg RipgrepFzf(<q-args>)

# coc.nvim
g:coc_global_extensions = [
  'coc-coverage',
  'coc-diagnostic',
  'coc-docthis',
  'coc-eslint',
  'coc-git',
  'coc-html',
  'coc-css',
  'coc-html-css-support',
  'coc-json',
  'coc-markdownlint',
  'coc-snippets',
  'coc-tsserver',
  'coc-vimlsp',
]

g:coc_user_config = {
  preferences: {
    useQuickfixForLocations: true
  },
  suggest: {
    noselect: true,
    enablePreselect: false
  },
  diagnostic: {
    errorSign: 'E',
    warningSign: 'W',
    infoSign: 'I',
    hintSign: 'H',
  },
  signature: {target: 'echo'},
  git: {
    conflict: {enabled: false}
  },
  html: {
    filetypes: ['html', 'javascript']
  },
  html-css-support: {
    enabledLanguages: ['html', 'javascript']
  },
  coverage: {
    jsonReportPath: './.tmp/coverage/coverage-final.json',
    uncoveredSign: {
      text: '☂ ',
      hlGroup: 'CocGitRemovedSign'
    }
  },
  languageserver: {
    rnix: {
      command: 'rnix-lsp',
      filetypes: ['nix']
    },
  },
  diagnostic-languageserver: {
    mergeConfig: true,
    filetypes: {
      yaml: 'yamllint'
    },
    formatters: {
      yamlfix: {
        command: 'yamlfix',
        args: ['-']
      },
      prettier: {
        command: 'prettier'
      }
    },
    formatFiletypes: {
      javascript: 'prettier',
      yaml: 'yamlfix'
    }
  }
}

nmap gd <Plug>(coc-definition)
nmap gr <Plug>(coc-references)
nmap K :call CocAction('doHover')<cr>
nmap <c-k> :call CocAction('showSignatureHelp')<cr>
nmap <leader>a <Plug>(coc-codeaction)
nmap <leader>d <cmd>CocDiagnostics<cr>
nmap <leader>l <cmd>CocList<cr>
nmap <leader>L <cmd>CocListResume<cr>

command! -nargs=0 Format call CocAction('format')
command! -nargs=0 OI call CocAction('runCommand', 'editor.action.organizeImport')

inoremap <silent><expr> <tab> coc#pum#visible() ? coc#pum#next(1) : '<tab>'
inoremap <expr><s-tab> coc#pum#visible() ? coc#pum#prev(1) : "<c-h>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "<cr><c-r>=coc#on_enter()<cr>"
g:coc_snippet_next = '<tab>'
g:coc_snippet_prev = '<s-tab>'
nmap [e <Plug>(coc-diagnostic-prev)
nmap ]e <Plug>(coc-diagnostic-next)
nmap <expr> ]c &diff ? ']c' : '<Plug>(coc-git-nextchunk)'
nmap <expr> [c &diff ? '[c' : '<Plug>(coc-git-prevchunk)'
nnoremap <silent> ghu :CocCommand git.chunkUndo<cr>
nnoremap <silent> ghs :CocCommand git.chunkStage<cr>
nnoremap <silent> ghp :CocCommand git.chunkInfo<cr>
nnoremap <silent> ghl :CocCommand git.browserOpen<cr>
nnoremap <silent> ghc :CocCommand git.showCommit<cr>
nnoremap <silent> ghf :CocCommand git.foldUnchanged<cr>
nnoremap <silent> ghb :CocCommand git.showBlameDoc<cr>

# fugitive
autocmd vimRc CmdlineEnter,BufReadPost * ++once plug#load('vim-fugitive')
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

# autoformat
g:formatters_javascript = ['prettier']
g:formatdef_custom_nix = '"nixpkgs-fmt"'
g:formatters_nix = ['custom_nix']
cabbrev af Autoformat

# floaterm
g:floaterm_height = 0.9
g:floaterm_width = 0.9
g:floaterm_autoclose = 2
g:floaterm_keymap_toggle = '<C-_>'

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

# smoothie
g:smoothie_remapped_commands = [
  '<C-D>', '<C-U>', '<C-F>', '<C-B>',
  '<S-Down>', '<PageDown>', '<S-Up>', '<PageUp>',
  'z+', 'z^', 'zt', 'z<CR>',
  'z.', 'zz', 'z-', 'zb',
  'gg', 'G', 'n', 'N', '{', '}', '``'
]

# colorscheme
set termguicolors
syntax enable
colorscheme gruvbit

set secure
