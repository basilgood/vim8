scriptencoding utf-8

if executable('./node_modules/.bin/prettier')
  command Format Dispatch! node_modules/.bin/prettier --single-quote --write %
else
  command Format Dispatch! npx prettier --single-quote --write %
endif
