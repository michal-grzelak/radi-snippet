#!/usr/bin/env bash
set -eou pipefail

# sudo usermod --shell /usr/bin/fish $USER

BREW_BIN="/home/linuxbrew/.linuxbrew/bin/brew"

if [ -f "$BREW_BIN" ]; then
    echo "=== [Homebrew] Exists. Updating... ==="
    $BREW_BIN update
else
    echo "=== [Homebrew] Not found. Installing... ==="
    NONINTERACTIVE=1 sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

sudo chown -R vscode:vscode /home/linuxbrew/.linuxbrew/
sudo chown -R vscode:vscode /mnt/mise-data

test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc

chezmoi init https://github.com/michal-grzelak/dotfiles --apply

mise trust
mise install

mise exec -- bun install