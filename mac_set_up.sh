#!/bin/bash

echo -e "\033[34m----------------------------------------\033[0m"
echo -e "\033[32m Welcome To \033[33mK Drive Setup \033[0m"
echo -e "\033[36m Developer : \033[35mNiranjan Kumar K \033[0m"
echo -e "\033[36m Version   : \033[31m1.0 \033[0m"
echo -e "\033[34m----------------------------------------\033[0m"
echo -e "\033[33mSetting up...\033[0m"

if [[ $(uname -m) == "arm64" ]]; then
    INSTALL_DIR="/opt/homebrew/bin"
else
    INSTALL_DIR="/usr/local/bin"
fi

sudo mkdir -p "$INSTALL_DIR"

curl -L https://hacker1514.github.io/download/k-mac.bin -o k

chmod +x k

sudo mv k "$INSTALL_DIR/k"

echo ""
echo -e "\033[34m----------------------------------------\033[0m"
echo -e "\033[36mGitHub Configuration\033[0m"
echo -e "\033[34m----------------------------------------\033[0m"

read -p "GitHub Username : " USERNAME
read -p "GitHub Email    : " EMAIL
read -s -p "GitHub PAT      : " TOKEN
echo

git config --global user.name "$USERNAME"
git config --global user.email "$EMAIL"
git config --global credential.helper store

cat > ~/.git-credentials <<EOF
https://${USERNAME}:${TOKEN}@github.com
EOF

chmod 600 ~/.git-credentials

echo ""
echo -e "\033[32mGitHub configured successfully!\033[0m"

echo ""
echo -e "\033[34m----------------------------------------\033[0m"
echo -e "\033[32m K Drive Installed Successfully ! \033[0m"
echo -e "\033[34m----------------------------------------\033[0m"
echo ""
echo -e "\033[33mVerify : \033[36mk help\033[0m"

rm -- "$0" >/dev/null 2>&1
