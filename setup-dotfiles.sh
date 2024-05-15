# ===Copy dotfiles===
curl -LJf https://github.com/soda3x/dotfiles/raw/master/.bash_aliases -o /home/$USER/.bash_aliases
curl -LJf https://github.com/soda3x/dotfiles/raw/master/.bashrc -o /home/$USER/.bashrc
curl -LJf https://github.com/soda3x/dotfiles/raw/master/.gitconfig -o /home/$USER/.gitconfig
curl -LJf https://github.com/soda3x/dotfiles/raw/master/.hushlogin -o /home/$USER/.hushlogin
curl -LJf https://github.com/soda3x/dotfiles/raw/master/.tmux.conf -o /home/$USER/.tmux.conf

# ===Update Gitconfig===
# I like to use my dotfiles at work too, for work I obviously don't want to use my at-home gitconfig
# for anyone using my dotfiles, i suppose this will allow you to specify your own gitconfig
# without editing the file directly

# Set default values for username and email
default_name="Bradley Newman"
default_email="bnewman227@gmail.com"

if [ "$#" -eq 2 ]; then
    name="$1"
    email="$2"
elif [ "$#" -eq 0 ]; then
    name="$default_name"
    email="$default_email"
else
    echo "Usage: $0 [<gitconfig-name> <gitconfig-email>]"
    exit 1
fi

# Update .gitconfig with provided username and email
sed -i "s/name = .*/name = $name/" /home/$USER/.gitconfig
sed -i "s/email = .*/email = $email/" home/$USER/.gitconfig

# ===Install programs===

# Install Nerd Fonts
git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts.git
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
sudo apt install python3 -y

# Install Node
curl -fsSL https://fnm.vercel.app/install | bash
fnm use --install-if-missing 20

# Install Neovim + Plugins
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
git clone --depth 1 https://github.com/AstroNvim/template /home/$USER/.config/nvim
rm -rf /home/$USER/.config/nvim/.git

cargo install tree-sitter-cli

sudo apt install ripgrep -y

sudo add-apt-repository ppa:daniel-milde/gdu -y
sudo apt update
sudo apt install gdu -y

curl -LO https://github.com/ClementTsang/bottom/releases/download/0.9.6/bottom_0.9.6_amd64.deb
sudo dpkg -i bottom_0.9.6_amd64.deb

# Install Tmux + Tmux Plugin Manager
sudo apt install tmux -y
git clone https://github.com/tmux-plugins/tpm /home/$USER/.tmux/plugins/tpm

# Install Lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# Install Lazydocker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

#===Finish===

# Reload Tmux (in the case it was already installed
source /home/$USER/.tmux.conf

# Reload bash
source /home/$USER/.bashrc
