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
sudo pacman -S hyprland hyprpaper xdg-desktop-portal-hyprland

yay -S sddm firefox yazi gvfs kitty neovim pipewire wireplumber pipewire-pulse pavucontrol stow neofetch zsh tmux rofi python-pywal zenity waybar rose-pine-hyprcursor wl-clipboard xclip mirage grim slurp nodejs npm dunst papirus-icon-theme

#setting up hyprpaper as user service
systemctl --user enable --now hyprpaper.service

#setting up tmux
echo "installing tpm"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#setting up eww
echo "installing rustup"
yay -S rustup jq
rustup default stable
cd ~
echo "cloning eww repo"
git clone https://github.com/elkowar/eww
cd ~/eww
echo "building eww"
cargo build --release --no-default-features --features=wayland

cd ~/Hyprland
stow . --adopt

#setting yazi desktop file
echo "setting yazi desktop file"
mkdir -p ~/.local/share/applications
cp ~/Hyprland/yazi.desktop ~/.local/share/applications/
#setting script permissions
echo "giving permission to scripts"
chmod +x ~/.config/hypr/loadWallpaper.sh
chmod +x ~/.config/wallpapers/setWal.sh
sudo chmod -R +x ~/.config/eww/scripts
cd ~/.config/eww/spotify
npm install


echo "setting up sddm"
sudo pacman -Syu qt6-svg qt6-declarative qt5-quickcontrols2
yay -S catppuccin-sddm-theme-macchiato 
sudo systemctl enable sddm
sudo mkdir -p /etc/sddm.conf.d
sudo cp ~/Hyprland/sddm.conf /etc/sddm.conf.d/theme.conf


#setting up zsh
echo "installing oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "cloning powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "cloning zsh autosuggestiong"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#downloading fallback font
# General Unicode coverage
echo "Setting up fonts"
cd ~/Hyprland
cp -r fonts ~/.local/share
sudo pacman -S noto-fonts noto-fonts-emoji noto-fonts-cjk noto-fonts-extra ttf-meslo-nerd

echo "Setting default applications"
xdg-mime default mirage.desktop image/png
xdg-mime default mirage.desktop image/jpg
xdg-mime default mirage.desktop image/jpeg

echo "reboot the system now to take effect"
