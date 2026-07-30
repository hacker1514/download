#!/bin/bash

echo -e "\033[34m----------------------------------------\033[0m"
echo -e "\033[32m Welcome To \033[33mK Programming Setup \033[0m"
echo -e "\033[36m Developer : \033[35mNiranjan Kumar K \033[0m"
echo -e "\033[36m Version   : \033[31m1.0 \033[0m"
echo -e "\033[34m----------------------------------------\033[0m"
echo -e "\033[33mSetting up...\033[0m"

if [[ $(uname -m) == "arm64" ]]; then
INSTALL_DIR="/opt/homebrew/bin"
else
INSTALL_DIR="/usr/local/bin"
fi

sudo mkdir -p $INSTALL_DIR >/dev/null 2>&1

curl -L https://kni-org.github.io/k/mac_k -o k >/dev/null 2>&1

chmod +x k >/dev/null 2>&1

sudo mv k $INSTALL_DIR/k >/dev/null 2>&1

echo ""
echo -e "\033[34m----------------------------------------\033[0m"
echo -e "\033[32m K Program Installed Successfully ! \033[0m"
echo -e "\033[34m----------------------------------------\033[0m"
echo ""
echo -e "\033[33mverify : \033[36mk --version \033[0m"

rm -- "$0" >/dev/null 2>&1
