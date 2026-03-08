#!/bin/bash

# ===Copy dotfiles===
curl -LJf https://github.com/soda3x/dotfiles/raw/master/.bash_aliases -o "/home/$USER/.bash_aliases"
curl -LJf https://github.com/soda3x/dotfiles/raw/master/.bashrc -o "/home/$USER/.bashrc"
curl -LJf https://github.com/soda3x/dotfiles/raw/master/.gitconfig -o "/home/$USER/.gitconfig"
curl -LJf https://github.com/soda3x/dotfiles/raw/master/.hushlogin -o "/home/$USER/.hushlogin"
curl -LJf https://github.com/soda3x/dotfiles/raw/master/.tmux.conf -o "/home/$USER/.tmux.conf"
curl -LJf https://github.com/soda3x/dotfiles/raw/master/brad.knsv -o "/home/$USER/brad.knsv"
curl -LJf https://github.com/soda3x/dotfiles/raw/master/alacritty.toml -o "/home/$USER/.config/alacritty.toml"

if [[ "$SHELL" != "/bin/bash" ]]; then
    echo "Changing default shell to bash..."
    # Note: This will prompt the user for their password
    chsh -s /bin/bash
    echo "Shell changed. You will need to log out and log back in for this to take effect."
else
    echo "Bash is already the default shell."
fi

# ===Source configs===
# Source files so you don't need to restart bash
source "/home/$USER/.bash_aliases"
source "/home/$USER/.bashrc"
source "/home/$USER/.gitconfig"
source "/home/$USER/.hushlogin"

# These will obviously only work if the above source worked
rb
rt

echo "Importing KDE Plasma profile..."
paru -S konsave
konsave -i "/home/$USER/brad.knsv"
konsave -a brad

echo "Installing packages..."
curl -LJf https://github.com/soda3x/dotfiles/raw/master/packages.txt -o "/home/$USER/packages.txt"

REPO_PKGS=()
AUR_PKGS=()
PACKAGE_FILE="/home/$USER/packages.txt"

# Read the file, ignoring comments and empty lines
for pkg in $(grep -E -v '^\s*#|^\s*$' "$PACKAGE_FILE"); do
    # Check if the package exists in the official repositories
    if pacman -Si "$pkg" &>/dev/null; then
        REPO_PKGS+=("$pkg")
    else
        AUR_PKGS+=("$pkg")
    fi
done

if [[ ${#REPO_PKGS[@]} -gt 0 ]]; then
    echo "Installing official repository packages: ${REPO_PKGS[*]}"
    sudo pacman -S --needed --noconfirm "${REPO_PKGS[@]}"
else
    echo "No official repository packages to install."
fi

# Fallback to paru for the remaining packages
if [[ ${#AUR_PKGS[@]} -gt 0 ]]; then
    echo "Installing AUR packages using paru: ${AUR_PKGS[*]}"
    # Note: paru should generally not be run with sudo
    paru -S --needed --noconfirm "${AUR_PKGS[@]}"
else
    echo "No AUR packages to install."
fi