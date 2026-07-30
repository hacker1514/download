#!/bin/bash

echo -e "\033[34m----------------------------------------\033[0m"
echo -e "\033[32m Welcome To \033[33mK Programming Setup \033[0m"
echo -e "\033[36m Developer : \033[35mNiranjan Kumar K \033[0m"
echo -e "\033[36m Version   : \033[31m1.0 \033[0m"
echo -e "\033[34m----------------------------------------\033[0m"
echo -e "\033[33mSetting up...\033[0m"

pkg install unzip curl -y >/dev/null 2>&1

mkdir -p $PREFIX/bin/k_programming >/dev/null 2>&1

curl -L https://kni-org.github.io/k/k.zip -o k.zip >/dev/null 2>&1

unzip -o k.zip -d $PREFIX/bin/k_programming >/dev/null 2>&1

chmod +x $PREFIX/bin/k_programming/k >/dev/null 2>&1

echo '#!/bin/bash
DIR=$PREFIX/bin/k_programming
LD_LIBRARY_PATH=$DIR:$PREFIX/lib $DIR/k "$@" 2>/dev/null' > $PREFIX/bin/k

chmod +x $PREFIX/bin/k >/dev/null 2>&1

echo ""
echo -e "\033[34m----------------------------------------\033[0m"
echo -e "\033[32m K Program Installed Successfully ! \033[0m"
echo -e "\033[34m----------------------------------------\033[0m"
echo ""
echo -e "\033[33mverify : \033[36mk --version \033[0m"

rm k.zip >/dev/null 2>&1
rm termux_set_up.sh >/dev/null 2>&1
