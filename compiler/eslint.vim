scriptencoding utf-8

setlocal makeprg=npx\ eslint\ %\ -f\ ~/.vim/compiler/eslint_formatter.js\ --fix
CompilerSet errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m
