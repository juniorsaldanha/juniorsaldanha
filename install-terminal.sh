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
    vcprompt
    google-cloud-sdk
    rar
    rectangle
    xquartz
    wine-stable
    wget
)
for el in ${brew_pack1[*]}; do
    echo "  Installing $el with brew."
    brew install -q $el
done

brew_pack2=(
    alfred
    google-chrome
    firefox
    alt-tab
    iterm2
    fig
    setapp
    nrlquaker-winbox
)
for el in ${brew_pack2[*]}; do
    echo "  Installing $el with brew."
    brew install -q $el
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
EOF

