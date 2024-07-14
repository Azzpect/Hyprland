git clone https://aur.archlinux.org/yay.git ~/.yay

cd ~/.yay
makepkg -si
sudo pacman -Syu
yay -S hyprland-git sddm firefox dolphin waybar alacritty neovim pipewire wireplumber pipewire-pulse pavucontrol

#move the .xinitrc file
