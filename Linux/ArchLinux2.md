                sudo pacman -Syu tmux
                sudo pacman -Syu kitty
                sudo pacman -Syu zsh


                pacman -S --needed git base-devel
                git clone https://aur.archlinux.org/yay.git
                cd yay
                makepkg -si


                pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si


                git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
                nano .zshrc
                source .zshrc


                git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
                nano .zshrc
                source .zshrc


                git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
                nano .zshrc
                source .zshrc


                Go to -> " # Add wisely, as too many plugins slow down shell startup." | add the following: 


                plugins=(
                        git
                        zsh-autosuggestions
                        # zsh-syntax-highlighting must be the last
                        zsh-syntax-highlighting
                )
