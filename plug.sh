set -euC
IFS=$'\n'

if ! [[ -d pack/bundle/start && -d pack/bundle/opt ]]; then
  mkdir -p pack/bundle/start pack/bundle/opt
fi

cd pack/bundle/start/

start=(
  "sgur/vim-editorconfig"
  "tpope/vim-fugitive"
  "cohama/agit.vim"
  "idanarye/vim-merginal"
  "airblade/vim-gitgutter"
  "tpope/vim-vinegar"
  "markonm/traces.vim"
  "AndrewRadev/inline_edit.vim"
  "basilgood/agrep"
  "djoshea/vim-autoread"
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
  "kana/vim-repeat"
  "tpope/vim-commentary"
  "tpope/vim-surround"
  "mileszs/ack.vim"
  "PanagiotisS/LargeFile"
  "neoclide/vim-jsx-improve"
  "sgur/cmdline-completion"
  "h1mesuke/vim-alignta"
  "terryma/vim-expand-region"
  "stefandtw/quickfix-reflector.vim"
  "markonm/hlyank.vim"
  "romainl/vim-cool"
  "simnalamburt/vim-mundo"
  "yuttie/comfortable-motion.vim"
  "boucherm/ShowMotion"
  "majutsushi/tagbar"
  "ctrlpvim/ctrlp.vim"
  "lucidstack/ctrlp-tmux.vim"
  "haya14busa/vim-asterisk"
)

for element in "${opt[@]}"; do
  if ! [ -d "${element#*/}" ]; then
    echo "cloning '$element'"
    git clone --quiet https://github.com/$element.git &
  fi
done
