#!/bin/bash

# DarkBlueEdg 2022

time1="$( date +"%R" )"

msgupdate() { echo -e "${*} \x1b[38;5;214m[${time1}]\e[0m \x1b[31;5;227m[SYSTEM UPDATE]:\e[0m\x1b[38;5;87m update\n" >&1;:;}
msgupgrade() { echo -e "${*} \x1b[38;5;214m[${time1}]\e[0m \x1b[31;5;227m[SYSTEM UPGRADE]:\e[0m\x1b[38;5;87m upgrade\n" >&1;:;}
msginstall() { echo -e "${*} \x1b[38;5;214m[${time1}]\e[0m \x1b[31;5;227m[INSTALL MISSING FILES]:\e[0m\x1b[38;5;87m git curl wget build-essential cmake\n" >&1;:;}
msggit() { echo -e "${*} \x1b[38;5;214m[${time1}]\e[0m \x1b[31;5;227m[DOWNLOADING XMRIG]:\e[0m\x1b[38;5;87m XMRIG\n" >&1;:;}
msgcmake() { echo -e "${*} \x1b[38;5;214m[${time1}]\e[0m \x1b[31;5;227m[CMAKE]:\e[0m\x1b[38;5;87m -DWITH_HWLOC=OFF make -j$(nproc)\n" >&1;:;}
msgconfig() { echo -e "${*} \x1b[38;5;214m[${time1}]\e[0m \x1b[31;5;227m[DOWNLOADING CONFIG]:\e[0m\x1b[38;5;87m config.json\n" >&1;:;}
msgstart() { echo -e "${*} \x1b[38;5;214m[${time1}]\e[0m \x1b[31;5;227m[DOWNLOADING START]:\e[0m\x1b[38;5;87m start.sh\n" >&1;:;}

cd
msgupdate
apt-get update

msgupgrade
apt-get upgrade -y && pkg update -y

msginstall
pkg install git curl wget build-essential cmake -y

msggit
git clone https://github.com/xmrig/xmrig.git

mkdir xmrig/build

cd xmrig/build

msgcmake
cmake .. -DWITH_HWLOC=OFF && make -j8

cd

cd xmrig/build

msgconfig
curl -L -o config.json https://raw.githubusercontent.com/DarkBlueEdg/test/main/config.json

cd

msgstart
curl -L -o start.sh https://raw.githubusercontent.com/DarkBlueEdg/test1/main/start.sh

chmod +x start.sh

./start.sh
