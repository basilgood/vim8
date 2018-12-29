if exists('current_compiler')
  finish
endif
let current_compiler = 'ag --nogroup --nocolor --column'

" CompilerSet boilerplate for older Vim
if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpoptions
set cpoptions&vim

CompilerSet makeprg=ag\ --nogroup\ --nocolor\ --column
CompilerSet errorformat=%f:%l:%c:%m

let &cpoptions = s:cpo_save
unlet s:cpo_save
