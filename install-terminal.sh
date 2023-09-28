#!/bin/zsh

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install p10k (https://github.com/romkatv/powerlevel10k)
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/plugins/powerlevel10k
echo 'source ~/.zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
# Download p10k configuration from github
curl -o ~/.zsh/plugins/powerlevel10k/p10k_conf.zsh https://raw.githubusercontent.com/juniorsaldanha/juniorsaldanha/main/p10k.zsh
echo 'source ~/.zsh/plugins/powerlevel10k/p10k_conf.zsh' >>~/.zshrc

# Install zsh-autosuggestions 
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions
echo 'source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' >>~/.zshrc

# Install zsh-syntax-highlight
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/plugins/zsh-syntax-highlighting
echo 'source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >>~/.zshrc

# Download custom functions from github
curl -o ~/.zsh/custom-functions.zsh https://raw.githubusercontent.com/juniorsaldanha/juniorsaldanha/main/custom-functions.zsh
echo 'source ~/.zsh/custom-functions.zsh' >>~/.zshrc

# Finish the program
echo 'Done! Everything installed! https://github.com/juniorsaldanha/juniorsaldanha'
