set -euC
IFS=$'\n'

if ! [[ -d pack/bundle/start && -d pack/bundle/opt ]]; then
  mkdir -p pack/bundle/start pack/bundle/opt
fi

cd pack/bundle/start/

start=(
  "sgur/vim-editorconfig"
  "tpope/vim-fugitive"
  "tpope/vim-vinegar"
  "idanarye/vim-merginal"
  "airblade/vim-gitgutter"
  "markonm/traces.vim"
  "bsdelf/bufferhint"
  "tpope/vim-repeat"
  "kana/vim-textobj-user"
  "junegunn/vim-after-object"
  "drmikehenry/vim-fixkey"
  "Shougo/context_filetype.vim"
  "itchyny/vim-parenmatch"
  "ferranpm/vim-autopairs"
)

for element in "${start[@]}"; do
  if ! [ -d "${element#*/}" ]; then
    echo "cloning '$element'"
    git clone --quiet https://github.com/$element.git &
  fi
done

cd ../opt/

opt=(
  "w0rp/ale"
  "thinca/vim-quickrun"
  "tpope/vim-commentary"
  "tpope/vim-surround"
  "PanagiotisS/LargeFile"
  "neoclide/vim-jsx-improve"
  "sgur/cmdline-completion"
  "terryma/vim-expand-region"
  "stefandtw/quickfix-reflector.vim"
  "markonm/hlyank.vim"
  "romainl/vim-cool"
  "mbbill/undotree"
  "yuttie/comfortable-motion.vim"
  "majutsushi/tagbar"
  "darfink/starsearch.vim"
  "tommcdo/vim-exchange"
  "godlygeek/tabular"
  "itchyny/vim-cmdline-ranges"
  "itchyny/vim-tmpbuffer"
  "basilgood/HiCursorWords"
  "kana/vim-textobj-line"
  "kana/vim-textobj-entire"
  "kana/vim-niceblock"
  "osyo-manga/vim-precious"
  "tpope/vim-dispatch"
  "thinca/vim-localrc"
  "Shougo/neocomplete.vim"
)

for element in "${opt[@]}"; do
  if ! [ -d "${element#*/}" ]; then
    echo "cloning '$element'"
    git clone --quiet https://github.com/$element.git &
  fi
done
