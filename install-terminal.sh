#!/bin/sh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# https://raw.githubusercontent.com/juniorsaldanha/juniorsaldanha/main/.p10k.zsh
# https://raw.githubusercontent.com/juniorsaldanha/juniorsaldanha/main/.juniorsaldanha.zsh
# https://raw.githubusercontent.com/juniorsaldanha/juniorsaldanha/main/alfred_theme.alfredappearance

echo "Download some files."
file_github_download=(
    .p10k.zsh
    .juniorsaldanha.zsh
    alfred_theme.alfredappearance
)
for el in ${file_github_download[*]}; do
    echo "  Downloading $el with brew."
    curl "https://raw.githubusercontent.com/juniorsaldanha/juniorsaldanha/main/$el" -s -o ~/.teste.$el
done
echo "Download done."

echo "-----_____-----_____-----_____-----_____-----_____-----_____-----_____-----"

echo "Update brew list and others things."
brew update -q

echo "Starting the installation of packages with brew."

brew_pack1=(
    git
    htop
    vcprompt
    pyenv
    sshpass
    rar
    xquartz
    wine-stable
    wget
    curl
    nano
    tree
    tmate
    google-cloud-sdk
    websocat
    unzip
    telnet
    alfred
    visual-studio-code
    rectangle
    google-chrome
    firefox
    alt-tab
    iterm2
    fig
    setapp
    nrlquaker-winbox
    cakebrew
    classicftp
    openvpn-connect
    forticlient
    openfortivpn
    node
    cmake
    rsync
    wireshark
    platformio
)
for el in ${brew_pack1[*]}; do
    echo "  Installing $el with brew."
    brew install -q -f $el
done

echo "Finished the installation with brew."
sleep 5
clear

cat << EOF
Open Setapp and the apps below
    - bartender4 
    - batteries
    - chatmate for whatsapp
    - cleanmymac x
    - cleanshow x
    - meeter
    - repeat
    - mission control plus
    - sidenotes

Configure
    - Alfred
        - license on email
        - Shortcut (cmd+space)
        - Install Theme (alfred_theme.alfredappearance on repo)
    - Bartender (license on email and with setapp)
    - Alt-Tab
        - Shortcut (cmd+tab)
    - Fig (best everything)
        - zsh-syntax-highlighting
        - zsh-you-should-use
        - zsh-autosuggestions
        - powerlevel10k (it will read the .p10k.zsh from home folder)
EOF

