# gentoo dots

## notes

### system update

```sh
sudo emaint --auto sync
sudo emerge --ask --verbose --update --deep --newuse @world
```

### recompiling kernel

```sh
cd /usr/src/linux
sudo make menuconfig # if options need to be changed
sudo make
sudo make install
```

### upgrading kernel

```sh
vi /etc/portage/package.mask # unmask kernel to allow new version
sudo emerge --ask --update --deep --with-bdeps=y --newuse sys-kernel/gentoo-sources
sudo eselect kernel list # select newest kernel
cd /usr/src/linux
sudo cp /home/maya/dots/kernelconfig ./.config
sudo make
sudo make install
grub-mkconfig -o /boot/grub/grub.cfg
sudo emerge --ask x11-drivers/nvidia-drivers
```
