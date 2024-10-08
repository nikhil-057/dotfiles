## ubuntu/debian setup

```
## cd into git repo before running the below
REPO_DIR=$PWD

## install zsh
sudo apt-get install zsh --yes
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo $0 ## should return zsh

## install packages
sudo apt-get update
sudo apt-get install \
    fd-find \
    ripgrep \
    unzip \
    lua5.1 \
    liblua5.1-dev \
    python3-pip \
    python3-venv \
    libevent-dev \
    ncurses-dev \
    build-essential \
    bison \
    pkg-config \
    --yes

## set workdir
if [ -z "$WORKDIR" ]; then
    export WORKDIR="$HOME"
fi

## nvim
mkdir -p $WORKDIR/install/nvim && cd $WORKDIR/install/nvim
wget -qO nvim-linux64.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim*/
sudo tar -C /opt -zxpf nvim-linux64.tar.gz

## tmux
mkdir -p $WORKDIR/install/tmux && cd $WORKDIR/install/tmux
wget -qO tmux-3.3a.tar.gz https://github.com/tmux/tmux/releases/download/3.3a/tmux-3.3a.tar.gz
rm -rf tmux-*/ && tar -zxpf tmux-*.tar.gz
cd tmux-*/
./configure && make && sudo make install

## npm packages
mkdir -p $WORKDIR/install/npm && cd $WORKDIR/install/npm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install v20.15.1
nvm use --delete-prefix v20.15.1
nvm alias default v20.15.1
npm install -g neovim
npm install -g tree-sitter-cli

## luarocks
mkdir -p $WORKDIR/install/luarocks && cd $WORKDIR/install/luarocks
wget -qO luarocks-3.11.1.tar.gz https://luarocks.org/releases/luarocks-3.11.1.tar.gz
rm -rf luarocks-*/ && tar -zxpf luarocks-*.tar.gz
cd luarocks-*/
./configure --lua-version=5.1
make && sudo make install
sudo luarocks install luasocket

cd $REPO_DIR
./setup.sh
source ~/.zshrc
```
