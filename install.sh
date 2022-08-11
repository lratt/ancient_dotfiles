#!/bin/sh

brew_init() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && brew bundle --file="$HOME/Brewfile"
}

rustup_init() {
    sh -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs)" \
        -- --default-toolchain nightly -y
}

cargo_init() {
  for sub in "whatfeatures" "play" "watch" "edit"; do
    cargo install "cargo-$sub"
  done

  # install nvim package manager
  cargo install --git https://github.com/lratt/npk npk
}

tpm_init() {
  if [[ ! -d ~/.tmux/plugins/tpm ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    tmux source ~/.tmux.conf
  fi
}

if [[ "$(uname -s)" == "Darwin" ]]; then
  brew_init
fi

rustup_init
cargo_init
tpm_init
