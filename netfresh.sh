#!/bin/bash


RED='\033[0;31m'
GREEN='\033[0;32m'

if [ "$#" = "0" ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]
then
    echo -e "Usage: $0 [flags]"
    echo -e "\nFlags:"
    echo -e "\t-r, --restart        Restart all network services."
    echo -e "\t-s, --start          Start all network services."
    echo -e "\t--stop               Stop all network services."
    echo -e "\n\t\t\t\t\t\t by ROHIT"
    
elif [ "$1" = "-r" ] || [ "$1" = "--restart" ]
then
    echo -e "${GREEN}[+] Disabled eth0 adaptor...............\033[0m"
    $(sudo ifconfig eth0 down)
    
    # enable eth0
    echo -e "${GREEN}[+] Enabled eth0 adaptor................\033[0m"
    $(sudo ifconfig eth0 up)

    echo -e "${GREEN}[+] Restarting NetworkManager services..\033[0m"
    $(sudo service NetworkManager restart)

    echo -e "${GREEN}[+] Restarting wpa_supplicant...........\033[0m"
    $(sudo service wpa_supplicant restart)

    echo -e "${GREEN}[+] Restarting networking services......\033[0m"
    $(sudo service networking restart)

    exit 0

elif [ "$1" = "-s" ] || [ "$1" = "--start" ]
then
    echo -e "${GREEN}[+] Disabled eth0 adaptor...............\033[0m"
    $(sudo ifconfig eth0 down)
    
    # enable eth0
    echo -e "${GREEN}[+] Enabled eth0 adaptor................\033[0m"
    $(sudo ifconfig eth0 up)

    echo -e "${GREEN}[+] Starting NetworkManager services....\033[0m"
    $(sudo service NetworkManager restart)

    echo -e "${GREEN}[+] Starting wpa_supplicant.............\033[0m"
    $(sudo service wpa_supplicant restart)

    echo -e "${GREEN}[+] Starting networking services........\033[0m"
    $(sudo service networking restart)

    exit 0

elif [ "$1" = "--stop" ]
then   
    echo -e "${GREEN}[+] Disabled eth0 adaptor...............\033[0m"
    $(sudo ifconfig eth0 down)

    # enable eth0
    echo -e "${GREEN}[+] Enabled eth0 adaptor................\033[0m"
    $(sudo ifconfig eth0 up)

    echo -e "${GREEN}[+] Stoping NetworkManager services.....\033[0m"
    $(sudo service NetworkManager stop)

    echo -e "${GREEN}[+] Stoping wpa_supplicant..............\033[0m"
    $(sudo service wpa_supplicant stop)

    echo -e "${GREEN}[+] Stoping networking services.........\033[0m"
    $(sudo service networking stop)

    exit 0

else
    echo -e "${RED}[-] Error: unknown shorthand flag: $1\033[0m"
fi
