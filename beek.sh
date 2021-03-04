#!/bin/bash
#Colors
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

trap ctrl_c INT

function ctrl_c(){
    echo -e "\n${yellowColour}[]${endColour}${grayColour}Saliendo${endColour}"
    rm /tmp/port.tmp
    exit 0
}

#echo "¿Cual es la IP?: "
#read -n 15 ip
echo -e "${purpleColour}______      _____ _"
sleep 0.05
echo -e "| ___ \    |  ___| |"
sleep 0.05
echo -e "| |_/ / ___| |__ | | __"
sleep 0.05
echo -e "| ___ \/ _ \  __|| |/ /"
sleep 0.05
echo -e "| |_/ /  __/ |___|   <"
sleep 0.05
echo -e "\____/ \___\____/|_|\_/${endColour}"
sleep 0.05
echo ""
echo -e "${turquoiseColour}by B3nji & Erik451${endColour}""\n"
if [ "$1" == "" ]

then
	echo -e "${yellowColour}Δ Insert an IP Δ${endColour}""\n"
	echo -e "${turquoiseColour}Example: ${endColour}"
	echo -e "${yellowColour}./beek.sh 10.10.10.10${endColour}"
else
	for port in {1..10000}; do
        	timeout 1 bash -c "echo >/dev/tcp/$1/$port" >& /dev/null \ && echo -e "${redColour}[${endColour}${yellowColour}*${endColour}${redColour}]${endColour} $1:$port OPEN" |tee -a /tmp/port.tmp &
	done;
	cat /tmp/port.tmp |  cut -d ':' -f 2 |  sed 's/OPEN//' | tr "\n" "," |tr -d " "| xclip -sel clip && rm /tmp/port.tmp
fi
