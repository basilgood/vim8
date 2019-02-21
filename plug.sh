set -euC
IFS=$'\n'

if ! [[ -d pack/bundle/start && -d pack/bundle/opt ]]; then
  mkdir -p pack/bundle/start pack/bundle/opt
fi

cd pack/bundle/start/

start=(
  "sgur/vim-editorconfig"
  "tpope/vim-fugitive"
  "idanarye/vim-merginal"
  "airblade/vim-gitgutter"
  "tpope/vim-vinegar"
  "markonm/traces.vim"
  "AndrewRadev/inline_edit.vim"
  "bsdelf/bufferhint"
  "tpope/vim-repeat"
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
  "tpope/vim-scriptease"
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
  "mhinz/vim-grepper"
  "andymass/vim-matchup"
  "tommcdo/vim-exchange"
  "junegunn/vim-easy-align"
  "benmills/vimux"
)

for element in "${opt[@]}"; do
  if ! [ -d "${element#*/}" ]; then
    echo "cloning '$element'"
    git clone --quiet https://github.com/$element.git &
  fi
done
