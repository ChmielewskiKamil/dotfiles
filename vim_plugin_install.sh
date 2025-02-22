#!/usr/bin/env bash
# Modified based on the following script:
# https://github.com/sentriz/dotfiles/blob/ec6487aab9467b6762b9c8f9a955777ad25a03f9/vim-plugin-install

# REMEMBER TO SYMLINK THE PLUGINS IN THE ACTUAL INSTALLATION!
# REMEMBER TO SYMLINK THE PLUGINS IN THE ACTUAL INSTALLATION!
# REMEMBER TO SYMLINK THE PLUGINS IN THE ACTUAL INSTALLATION!
# When you clone the dotfiles repo e.g. in the Dockerfiles, 
# the nvim/site/pack/plugins/start/ is relative to the cloned repo. You must 
# create a symlink to the /root/.local/share/nvim/site/pack/plugins/start/ or
# whatever it will be on your OS.

set -e

if test $# -ne 1; then
    echo "please provide a repository link" >&2
    exit 1
fi

repo="$1"
# On linux you can use grep with --P flag.
name="$(echo "$repo" | sed 's:.*/::')"  # Extract repo name without GNU grep
dotfiles_repo="$(git rev-parse --show-toplevel)"  # Get dotfiles repo root
plugin_path="$dotfiles_repo/nvim/site/pack/plugins/start/$name"

mkdir -p "$(dirname "$plugin_path")"
git submodule add -f "$repo" "$plugin_path"

echo "Plugin added as a submodule to $plugin_path"
