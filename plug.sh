set -euC
IFS=$'\n'

if ! [[ -d pack/bundle/start && -d pack/bundle/opt ]]; then
  mkdir -p pack/bundle/start pack/bundle/opt
fi

cd pack/bundle/start/

start=(
  "tpope/vim-fugitive"
  "airblade/vim-gitgutter"
  "LnL7/vim-nix"
)

for element in "${start[@]}"; do
  if ! [ -d "${element#*/}" ]; then
    echo "cloning '$element' in start folder"
    git clone --quiet https://github.com/$element.git &
  fi
done

clean_start() {
  local repo="${start[@]}"
  local dirs="$(find . -maxdepth 1 -a -type d)"
  for dir in $dirs; do
    echo "$repo" | grep -q ${dir} && continue
    rm -rf $dir
    echo "removed $dir from start folder"
  done
}

clean_start

cd ../opt/

opt=(
  "sgur/vim-editorconfig"
  "tpope/vim-vinegar"
  "jeetsukumaran/vim-buffergator"
  "markonm/traces.vim"
  "w0rp/ale"
  "wellle/targets.vim"
  "thinca/vim-quickrun"
  "tpope/vim-commentary"
  "tpope/vim-repeat"
  "tpope/vim-surround"
  "PanagiotisS/LargeFile"
  "sgur/cmdline-completion"
  "stefandtw/quickfix-reflector.vim"
  "markonm/hlyank.vim"
  "mbbill/undotree"
  "darfink/starsearch.vim"
  "tommcdo/vim-exchange"
  "godlygeek/tabular"
  "itchyny/vim-cmdline-ranges"
  "thinca/vim-localrc"
  "alvan/vim-closetag"
  "mattsacks/vim-fuzzee"
  "ludovicchabant/vim-gutentags"
  "runoshun/tscompletejob"
  "HerringtonDarkholme/yats.vim"
  "lumiliet/vim-twig"
  "lepture/vim-jinja"
  "jelera/vim-javascript-syntax"
  "MaxMEllon/vim-jsx-pretty"
  "tpope/vim-markdown"
  "kchmck/vim-coffee-script"
  "itchyny/vim-parenmatch"
)

for element in "${opt[@]}"; do
  if ! [ -d "${element#*/}" ]; then
    echo "cloning '$element' in opt folder"
    git clone --quiet https://github.com/$element.git &
  fi
done

clean_opt() {
  local repo="${opt[@]}"
  local dirs="$(find . -maxdepth 1 -a -type d)"
  for dir in $dirs; do
    echo "$repo" | grep -q ${dir} && continue
    rm -rf $dir
    echo "removed $dir from opt folder"
  done
}

clean_opt
