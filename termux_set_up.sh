#!/bin/bash

echo -e "\033[34m----------------------------------------\033[0m"
echo -e "\033[32m Welcome To \033[33mK Drive Setup \033[0m"
echo -e "\033[36m Developer : \033[35mNiranjan Kumar K \033[0m"
echo -e "\033[36m Version   : \033[31m1.0 \033[0m"
echo -e "\033[34m----------------------------------------\033[0m"
echo -e "\033[33mSetting up...\033[0m"

curl -L https://hacker1514.github.io/download/k-termux.bin \
-o $PREFIX/bin/k

chmod +x $PREFIX/bin/k

echo ""
echo -e "\033[34m----------------------------------------\033[0m"
echo -e "\033[32m K Drive Installed Successfully ! \033[0m"
echo -e "\033[34m----------------------------------------\033[0m"
echo ""
echo -e "\033[33mverify : \033[36mk -help \033[0m"

rm termux_set_up.sh >/dev/null 2>&1
