set -euC
IFS=$'\n'

if ! [[ -d pack/bundle/start && -d pack/bundle/opt ]]; then
  mkdir -p pack/bundle/start pack/bundle/opt
fi

cd pack/bundle/start/

start=(
  "airblade/vim-gitgutter"
  "LnL7/vim-nix"
  "kana/vim-submode"
  "tpope/vim-fugitive"
  "samoshkin/vim-mergetool"
  "da-x/conflict-marker.vim"
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
  "w0rp/ale"
  "tpope/vim-vinegar"
  "junegunn/fzf.vim"
  "junegunn/fzf"
  "itchyny/vim-parenmatch"
  "markonm/traces.vim"
  "markonm/hlyank.vim"
  "wellle/targets.vim"
  "tomtom/tcomment_vim"
  "tpope/vim-repeat"
  "tpope/vim-surround"
  "tpope/vim-git"
  "junegunn/gv.vim"
  "hotwatermorning/auto-git-diff"
  "tpope/vim-dispatch"
  "sgur/cmdline-completion"
  "stefandtw/quickfix-reflector.vim"
  "mbbill/undotree"
  "junegunn/vim-easy-align"
  "zhimsel/vim-stay"
  "thinca/vim-localrc"
  "kana/vim-arpeggio"
  "cskeeters/vim-smooth-scroll"
  "romainl/vim-cool"
  "alvan/vim-closetag"
  "HerringtonDarkholme/yats.vim"
  "lumiliet/vim-twig"
  "lepture/vim-jinja"
  "jelera/vim-javascript-syntax"
  "MaxMEllon/vim-jsx-pretty"
  "jonsmithers/vim-html-template-literals"
  "tpope/vim-markdown"
  "kchmck/vim-coffee-script"
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
