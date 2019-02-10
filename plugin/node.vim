scriptencoding utf-8

let bindir='./node_modules/.bin'
if !empty(glob(bindir))
  let $PATH=bindir . ':' . $PATH
endif
