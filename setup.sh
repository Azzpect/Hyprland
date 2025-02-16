echo "copying pacman config file"
sudo cp ~/Hyprland/pacman.conf /etc/

echo "Cloning yay repository to ~/.yay"
git clone https://aur.archlinux.org/yay.git ~/.yay

cd ~/.yay
echo "building yay from source"
makepkg -si

sleep 1

echo "updating aur"
sudo pacman -Syu

echo "downloading hyprland, sddm, dolphing waybar, alcritty, neovim, pipewire, wireplumber, pipewire-pulse, pavucontrol" 
yay -S hyprland-git 

yay -S sddm firefox thunar gvfs alacritty neovim pipewire wireplumber pipewire-pulse pavucontrol xdg-desktop-portal-hyprland-git stow neofetch zsh tmux rofi-lbonn-wayland-git sddm-sugar-dark hyprpaper-git python-pywal zenity waybar rose-pine-hyprcursor wl-clipboard xclip

#setting up hyprpaper as user service
systemctl --user enable --now hyprpaper.service

#setting up tmux
echo "installing tpm"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cd ~/Hyprland
stow . --adopt

#setting wallpaper engines
echo "giving permission to the wallpaper engines"
chmod +x ~/.config/hypr/loadWallpaper.sh
chmod +x ~/.config/hypr/restartWaybar.sh
chmod +x ~/.config/wallpapers/setWal.sh


echo "setting up sddm"
sudo pacman -Syu qt6-svg qt6-declarative qt5-quickcontrols2
yay -S catppuccin-sddm-theme-macchiato 
sudo systemctl enable sddm


#setting up zsh
echo "installing oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "cloning powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "cloning zsh autosuggestiong"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "reboot the system now to take effect"
