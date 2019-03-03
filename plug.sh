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
  "basilgood/agrep"
  "itchyny/vim-parenmatch"
  "kana/vim-textobj-user"
  "drmikehenry/vim-fixkey"
  "prettier/vim-prettier"
  "Shougo/context_filetype.vim"
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
  "tommcdo/vim-exchange"
  "junegunn/vim-easy-align"
  "benmills/vimux"
  "itchyny/vim-winfix"
  "itchyny/vim-cmdline-ranges"
  "itchyny/vim-tmpbuffer"
  "kana/vim-textobj-line"
  "rhysd/vim-textobj-anyblock"
  "osyo-manga/vim-precious"
  "junegunn/vim-peekaboo"
)

for element in "${opt[@]}"; do
  if ! [ -d "${element#*/}" ]; then
    echo "cloning '$element'"
    git clone --quiet https://github.com/$element.git &
  fi
done
