# Stable debian cannot install nvim >0.7.0 because of the old lib C lib versions.
# Lets hope trixie does not make oopsie woopsie.
FROM debian:trixie

# Install dependencies (basic system utilities)
RUN apt update && apt install -y \
    git \
    curl \
    ripgrep \
    && rm -rf /var/lib/apt/lists/*

# Install Neovim via appimage. This might eventually break in case there is 
# a mismatch between the GLIBC version of the debian base and the version required
# by Neovim.
RUN curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux-arm64.appimage && \
    chmod u+x nvim-linux-arm64.appimage && ./nvim-linux-arm64.appimage --appimage-extract && \
    ln -s /squashfs-root/AppRun /usr/bin/nvim

# Create a non-root user named auditor and switch to that user. The goal is to
# reduce the priviledges.
# TODO: Research ways to harden the container.
RUN useradd -m auditor
USER auditor

# Pull the dotfiles from remote repo. The submodules must be cloned recursively
# since the neovim config uses them to store plugins.
RUN git clone --recursive https://github.com/ChmielewskiKamil/dotfiles /home/auditor/dotfiles

# Link the dotfiles nvim with the place where the actual local nvim config is 
# expected to be.
RUN mkdir -p /home/auditor/.config && ln -s /home/auditor/dotfiles/nvim /home/auditor/.config/nvim

# The .local/share/nvim/site/pack/*/start directory is the place where neovim
# expects the plugins to be. During initialization this is loaded. Make a link
# between the cloned submodules from the dotfiles to the actual config.
RUN mkdir -p /home/auditor/.local/share/nvim/site/pack/plugins/start && \
    ln -s /home/auditor/dotfiles/nvim/site/pack/plugins/start/* /home/auditor/.local/share/nvim/site/pack/plugins/start/
