#!/bin/bash

BLUE="\033[34m"
GREEN="\033[32m"
YELLOW="\033[33m"
CYAN="\033[36m"
MAGENTA="\033[35m"
RED="\033[31m"
RESET="\033[0m"

echo -e "${BLUE}----------------------------------------${RESET}"
echo -e "${GREEN} Welcome To ${YELLOW}K Programming Setup ${RESET}"
echo -e "${CYAN} Developer : ${MAGENTA}Niranjan Kumar K ${RESET}"
echo -e "${CYAN} Version   : ${RED}1.0 ${RESET}"
echo -e "${BLUE}----------------------------------------${RESET}"
echo -e "${YELLOW}Setting up...${RESET}"

curl -L https://kni-org.github.io/k/k -o k >/dev/null 2>&1

chmod +x k >/dev/null 2>&1

sudo mv k /usr/local/bin/ >/dev/null 2>&1

echo ""
echo -e "${BLUE}----------------------------------------${RESET}"
echo -e "${GREEN} K Program Installed Successfully ! ${RESET}"
echo -e "${BLUE}----------------------------------------${RESET}"
echo ""
echo -e "${YELLOW}verify : ${CYAN}k --version ${RESET}"

rm linux_set_up.sh >/dev/null 2>&1
