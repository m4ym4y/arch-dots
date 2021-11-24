#!/bin/bash
set -e

# go to dotfile dir
cd `dirname $0`
echo "Running in '`pwd`'..."

# mkdirs
echo "Initializing directories"
mkdir -p ~/.config/{i3,kitty,'gtk-3.0',i3blocks,nvim,polybar,alacritty}
mkdir -p ~/{bin,go,npm}
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

# kitty colors
if [ ! -d "$HOME/.config/kitty/kitty-themes" ]; then
  echo "Kitty themes do not exist; installing..."
  git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
fi

KITTY_THEME="Fideloper"
echo "Setting kitty & alacritty theme to '${KITTY_THEME}'"
rm -f ~/.config/kitty/theme.conf
ln -s $HOME/.config/kitty/kitty-themes/themes/$KITTY_THEME.conf $HOME/.config/kitty/theme.conf

echo "Generating Xresources from ${KITTY_THEME}"
cat ~/.config/kitty/theme.conf | sed -e 's/^/\*/' -e 's/ /:/' > ~/.Xresources

# desktop files
echo "Copying desktop files..."
cp ./bashrc ~/.bashrc
cp ./i3config ~/.config/i3/config
cp ./init.vim ~/.config/nvim/init.vim
cp ./i3blocks ~/.config/i3blocks/config
cp ./kitty.conf ~/.config/kitty/kitty.conf
cp ./gtksettings.ini ~/.config/gtk-3.0/settings.ini
cp ./polybar ~/.config/polybar/config
cp ./alacritty.yml ~/.config/alacritty/alacritty.yml

# alacritty theme
echo "Generating alacritty theme from ${KITTY_THEME}"
kitty-to-alacritty ~/.config/kitty/theme.conf >> ~/.config/alacritty/alacritty.yml

echo "Restarting i3..."
i3-msg restart
