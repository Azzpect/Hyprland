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

yay -S sddm firefox dolphin alacritty neovim pipewire wireplumber pipewire-pulse pavucontrol stow neofetch zsh tmux rofi-lbonn-wayland-git sddm-sugar-dark hyprpaper-git python-pywal zenity waybar rose-pine-hyprcursor wl-clipboard

#setting up hyprpaper as user service
systemctl --user enable --now hyprpaper.service
#setting up zsh

echo "installing oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "cloning powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "cloning zsh autosuggestiong"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


#setting up tmux
echo "installing tpm"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cd ~/Hyprland
stow .

#setting wallpaper engines
echo "giving permission to the wallpaper engines"
chmod +x ~/.config/hypr/loadWallpaper.sh
chmod +x ~/.config/hypr/restartWaybar.sh
chmod +x ~/.config/wallpapers/setWal.sh


sudo systemctl enable sddm
reboot
