echo "Cloning yay repository to ~/.yay"
git clone https://aur.archlinux.org/yay.git ~/.yay

cd ~/.yay
echo "building yay from source"
makepkg -si


echo "updating aur"
sudo pacman -Syu

echo "downloading hyprland, sddm, dolphing waybar, alcritty, neovim, pipewire, wireplumber, pipewire-pulse, pavucontrol" 
yay -S hyprland-git sddm firefox dolphin waybar alacritty neovim pipewire wireplumber pipewire-pulse pavucontrol tmux

#setting up zsh
yay -S zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "cloning powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "cloning zsh autosuggestiong"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
rm ~/.zshrc

#move the .xinitrc file
