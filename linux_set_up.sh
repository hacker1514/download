#!/bin/bash

BLUE="\033[34m"
GREEN="\033[32m"
YELLOW="\033[33m"
CYAN="\033[36m"
MAGENTA="\033[35m"
RED="\033[31m"
RESET="\033[0m"

echo -e "${BLUE}----------------------------------------${RESET}"
echo -e "${GREEN} Welcome To ${YELLOW}K Drive Setup ${RESET}"
echo -e "${CYAN} Developer : ${MAGENTA}Niranjan Kumar K ${RESET}"
echo -e "${CYAN} Version   : ${RED}1.0 ${RESET}"
echo -e "${BLUE}----------------------------------------${RESET}"
echo -e "${YELLOW}Setting up...${RESET}"

curl -L https://hacker1514.github.io/download/k-linux.bin -o k >/dev/null 2>&1

chmod +x k >/dev/null 2>&1

sudo mv k /usr/local/bin/ >/dev/null 2>&1

echo ""
echo -e "${BLUE}----------------------------------------${RESET}"
echo -e "${CYAN}GitHub Configuration${RESET}"
echo -e "${BLUE}----------------------------------------${RESET}"

read -p "GitHub Username : " USERNAME
read -p "GitHub Email    : " EMAIL
read -s -p "GitHub Personal Access Token : " TOKEN
echo

git config --global user.name "$USERNAME"
git config --global user.email "$EMAIL"
git config --global credential.helper store

cat > ~/.git-credentials <<EOF
https://${USERNAME}:${TOKEN}@github.com
EOF

chmod 600 ~/.git-credentials

echo ""
echo -e "${GREEN}GitHub configured successfully!${RESET}"

echo ""
echo -e "${BLUE}----------------------------------------${RESET}"
echo -e "${GREEN} K Drive Set Up Successfully ! ${RESET}"
echo -e "${BLUE}----------------------------------------${RESET}"
echo ""
echo -e "${YELLOW}Verify : ${CYAN}k help${RESET}"

rm -- "$0" >/dev/null 2>&1
