set -euC
IFS=$'\n'

if ! [[ -d pack/bundle/start && -d pack/bundle/opt ]]; then
  mkdir -p pack/bundle/start pack/bundle/opt
fi

cd pack/bundle/start/

start=(
  "sgur/vim-editorconfig"
  "tpope/vim-fugitive"
  "airblade/vim-gitgutter"
  "markonm/traces.vim"
  "bsdelf/bufferhint"
  "kana/vim-textobj-user"
  "junegunn/vim-after-object"
  "drmikehenry/vim-fixkey"
  "Shougo/context_filetype.vim"
  "itchyny/vim-parenmatch"
  "sheerun/vim-polyglot"
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
  "w0rp/ale"
  "thinca/vim-quickrun"
  "tpope/vim-commentary"
  "tpope/vim-repeat"
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
  "darfink/starsearch.vim"
  "tommcdo/vim-exchange"
  "godlygeek/tabular"
  "itchyny/vim-cmdline-ranges"
  "itchyny/vim-tmpbuffer"
  "basilgood/HiCursorWords"
  "kana/vim-textobj-line"
  "kana/vim-textobj-entire"
  "kana/vim-textobj-indent"
  "kana/vim-niceblock"
  "osyo-manga/vim-precious"
  "tpope/vim-dispatch"
  "thinca/vim-localrc"
  "alvan/vim-closetag"
  "wellle/targets.vim"
  "troydm/easybuffer.vim"
  "vifm/neovim-vifm"
  "mattsacks/vim-fuzzee"
  "ludovicchabant/vim-gutentags"
  "runoshun/tscompletejob"
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
