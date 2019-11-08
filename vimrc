set encoding=utf-8
scriptencoding utf-8

augroup vimRc
 autocmd!
augroup END

if has('vim_starting') && has('reltime')
  let s:startuptime = reltime()
  au vimRc VimEnter * let s:startuptime = reltime(s:startuptime) | redraw
        \ | echomsg 'startuptime: ' . reltimestr(s:startuptime)
endif

" Vim 8 defaults
unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

source $HOME/.vim/rc/unix.vim
source $HOME/.vim/rc/environment.vim
source $HOME/.vim/rc/navigation.vim
source $HOME/.vim/rc/git.vim
source $HOME/.vim/rc/edit.vim
" source $HOME/.vim/rc/lsp.vim
source $HOME/.vim/rc/coc.vim
" source $HOME/.vim/rc/lint.vim
source $HOME/.vim/rc/misc.vim
source $HOME/.vim/rc/file-type.vim
source $HOME/.vim/rc/plug-manager.vim
source $HOME/.vim/rc/unload.vim
source $HOME/.vim/rc/options.vim
source $HOME/.vim/rc/mapping.vim
source $HOME/.vim/rc/statusline.vim
source $HOME/.vim/rc/hlsearch.vim
source $HOME/.vim/rc/commands.vim
source $HOME/.vim/rc/autocmds.vim

" sytax enable.
call vimrc#on_filetype()

set background=dark
silent! colorscheme nordish
highlight ParenMatch     guifg=#85EB6A guibg=#135B00 gui=NONE   cterm=NONE term=reverse ctermbg=11
highlight Comment        guifg=#5c6370 guibg=NONE    gui=italic cterm=italic

set secure
