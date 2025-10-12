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

yay -S sddm firefox thunar gvfs alacritty neovim pipewire wireplumber pipewire-pulse pavucontrol xdg-desktop-portal-hyprland-git stow neofetch zsh tmux rofi hyprpaper python-pywal zenity waybar rose-pine-hyprcursor wl-clipboard xclip mirage grim slurp

#setting up hyprpaper as user service
systemctl --user enable --now hyprpaper.service

#setting up tmux
echo "installing tpm"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#setting up eww
echo "installing rustup"
yay -S rustup
rustup default stable
cd ~
echo "cloning eww repo"
git clone https://github.com/elkowar/eww
cd ~/eww
echo "building eww"
cargo build --release --no-default-features --features=wayland

cd ~/Hyprland
stow . --adopt

#setting script permissions
echo "giving permission to scripts"
chmod +x ~/.config/hypr/loadWallpaper.sh
chmod +x ~/.config/wallpapers/setWal.sh
chmod +x ~/.config/wallpapers/setWal.sh
sudo -R +x ~/.config/eww/scripts


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

#downloading fallback font
# General Unicode coverage
sudo pacman -S noto-fonts noto-fonts-emoji noto-fonts-cjk noto-fonts-extra


echo "reboot the system now to take effect"
