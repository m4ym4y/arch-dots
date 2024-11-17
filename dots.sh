#!/bin/bash
set -e

# go to dotfile dir
cd ~/dots
echo "Running in '`pwd`'..."

# mkdirs
echo "Initializing directories"
mkdir -p ~/.config/{i3,kitty,'gtk-3.0',i3blocks,nvim,polybar,alacritty}
mkdir -p ~/.config/alacritty/themes
mkdir -p ~/.config/coc/ultisnips
mkdir -p ~/{bin,go,npm,.ssh}
mkdir -p ~/pics/scrot ~/pics/wallpaper
mkdir -p ~/.local/share/fonts

# fonts
cp ./fonts/* ~/.local/share/fonts

# scripts
echo "Installing scripts..."
cp ./bin/* ~/bin
chmod +x ~/bin/*
ln -sf "`pwd`/dots.sh" $HOME/bin/dots.sh

# colorscripts
if [ ! -d "$HOME/bin/color-scripts" ]; then
  echo "Color scripts do not exist; installing..."
  git clone https://github.com/stark/color-scripts ~/bin/color-scripts
  chmod +x ~/bin/color-scripts/color-scripts/*
fi

# desktop files
echo "Copying desktop files..."
cp ./bashrc ~/.bashrc
cp ./i3config ~/.config/i3/config
cp ./init.vim ~/.config/nvim/init.vim
cp ./snippets/* ~/.config/coc/ultisnips
cp ./i3blocks ~/.config/i3blocks/config
cp ./kitty.conf ~/.config/kitty/kitty.conf
cp ./gtksettings.ini ~/.config/gtk-3.0/settings.ini
cp ./polybar ~/.config/polybar/config
cp -r ./alacritty-theme/* ~/.config/alacritty/themes
cp ./alacritty.toml ~/.config/alacritty/alacritty.toml
cp ./sshconfig ~/.ssh/config
cp ./gitconfig ~/.gitconfig
