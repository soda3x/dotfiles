# ===Copy dotfiles===

# ===Install programs===

# Install Nerd Fonts
git clone --filter=blob:none --sparse git@github.com:ryanoasis/nerd-fonts
cd nerd-fonts
./install.sh
cd ..
# Refresh Font Cache
fc-cache -fv

# Install Cargo
sudo apt install cargo -y

# Install Fastfetch
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch -y
sudo apt update
sudo apt install fastfetch -y

# Install GCC
sudo apt install gcc -y

# Install Python
sudo apt install python -y

# Install Node
curl -fsSL https://fnm.vercel.app/install | bash
fnm use --install-if-missing 20

# Install Neovim + Plugins
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git

cargo install tree-sitter-cli

sudo apt install ripgrep -y

sudo add-apt-repository ppa:daniel-milde/gdu -y
sudo apt update
sudo apt install gdu -y

curl -LO https://github.com/ClementTsang/bottom/releases/download/0.9.6/bottom_0.9.6_amd64.deb
sudo dpkg -i bottom_0.9.6_amd64.deb



# Install Tmux + Tmux Plugin Manager
sudo apt install tmux -y
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install Lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin -y

# Install Lazydocker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
