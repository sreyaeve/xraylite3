#!/bin/bash

MYIP=$(wget -qO- ipinfo.io/ip);

echo "Checking VPS"

CEKEXPIRED () {

    today=$(date -d +1day +%Y-%m-%d)

    Exp1=$(curl -sS https://raw.githubusercontent.com/sreyaeve/IP-Register/main/ip | grep $MYIP | awk '{print $3}')

    if [[ $today < $Exp1 ]]; then

    echo -e "\e[32mSTATUS SCRIPT AKTIF...\e[0m"

    else

    echo -e "\e[31mSCRIPT ANDA EXPIRED!\e[0m";

    

    exit 0

fi

}

IZIN=$(curl -sS https://raw.githubusercontent.com/sreyaeve/IP-Register/main/ip | awk '{print $4}' | grep $MYIP)

if [ $MYIP = $IZIN ]; then

echo -e "\e[32mPermission Accepted...\e[0m"

CEKEXPIRED

else

echo -e "\e[31mPermission Denied!\e[0m";

exit 0

fi

clear
echo -e "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "          • SYSTEM MENU •             "
echo -e "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e " [\e[36m•1\e[0m] Menu Domain"
echo -e " [\e[36m•2\e[0m] Speedtest VPS"
echo -e " [\e[36m•3\e[0m] Setting Auto Reboot"
echo -e " [\e[36m•4\e[0m] Restart Xray Service"
echo -e " [\e[36m•5\e[0m] Install TCP BBR"
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e   ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo -e   ""
echo -e "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; m-domain ; exit ;;
2) clear ; speedtest ; exit ;;
3) clear ; auto-reboot ; exit ;;
4) clear ; restart ; exit ;;
5) clear ; m-tcp ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo -e "" ; echo "Anda salah tekan" ; sleep 1 ; m-system ;;
esac
