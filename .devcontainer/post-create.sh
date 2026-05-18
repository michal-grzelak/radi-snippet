#!/usr/bin/env bash
set -eou pipefail

# sudo usermod --shell /usr/bin/fish $USER

sudo chown -R vscode:vscode /home/linuxbrew/.linuxbrew/
sudo chown -R vscode:vscode /mnt/mise-data

test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc

chezmoi init https://github.com/michal-grzelak/dotfiles --apply

mise trust
mise install

mise exec -- bun install