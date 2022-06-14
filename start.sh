#!/bin/bash

# DarkBlueEdg 2022

time1="$( date +"%R" )"

msgxmrig() { echo -e "${*} \x1b[38;5;214m[${time1}]\e[0m \x1b[31;5;227m[STARTING XMRIG]:\e[0m\x1b[38;5;87m XMRIG\n" >&1;:;}

cd xmrig/build

msgxmrig
./xmrig
