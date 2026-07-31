#!/bin/bash

GREEN="\033[32m"
BLUE="\033[34m"
CYAN="\033[36m"
YELLOW="\033[33m"
RED="\033[31m"
MAGENTA="\033[35m"
RESET="\033[0m"

echo -e "${BLUE}----------------------------------------${RESET}"
echo -e "${GREEN} Welcome To ${YELLOW}K Drive Setup ${RESET}"
echo -e "${CYAN} Developer : ${MAGENTA}Niranjan Kumar K ${RESET}"
echo -e "${CYAN} Version   : ${RED}1.0 ${RESET}"
echo -e "${BLUE}----------------------------------------${RESET}"
echo -e "${YELLOW}Installing K Drive...${RESET}"

curl -L https://hacker1514.github.io/download/k-termux.bin \
-o $PREFIX/bin/k

chmod +x $PREFIX/bin/k

echo ""
echo -e "${BLUE}----------------------------------------${RESET}"
echo -e "${CYAN}GitHub Configuration${RESET}"
echo -e "${BLUE}----------------------------------------${RESET}"

read -p "GitHub Username : " USERNAME
read -s -p "GitHub Personal Access Token : " TOKEN
echo

git config --global user.name "$USERNAME"

read -p "Git Email : " EMAIL
git config --global user.email "$EMAIL"

git config --global credential.helper store

cat > ~/.git-credentials <<EOF
https://${USERNAME}:${TOKEN}@github.com
EOF

chmod 600 ~/.git-credentials

echo ""
echo -e "${GREEN}GitHub credentials configured successfully.${RESET}"

echo ""
echo -e "${BLUE}----------------------------------------${RESET}"
echo -e "${GREEN} K Drive Installed Successfully! ${RESET}"
echo -e "${BLUE}----------------------------------------${RESET}"
echo ""
echo -e "${YELLOW}Commands:${RESET}"
echo -e "${CYAN}k help${RESET}      - Show help"
echo -e "${CYAN}k start${RESET}     - Clone repository"
echo -e "${CYAN}k activate${RESET} - Open K Drive"
echo -e "${CYAN}k update${RESET}    - Commit & Push"
echo -e "${CYAN}k end${RESET}       - Remove K Drive"

rm -f termux_set_up.sh >/dev/null 2>&1
