#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear
echo -e "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "          • VMESS MENU •              "
echo -e "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e " [\e[36m•1\e[0m] Buat Akun Vmess "
echo -e " [\e[36m•2\e[0m] Trial Akun Vmess "
echo -e " [\e[36m•3\e[0m] Perpanjang Account Vmess "
echo -e " [\e[36m•4\e[0m] Hapus Akun Vmess "
echo -e " [\e[36m•5\e[0m] Cek User Login Vmess "
echo -e " [\e[36m•6\e[0m] Cek User Vmess Akun "
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo ""
echo -e "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu :  "  opt
echo -e ""
case $opt in
1) clear ; add-ws ; exit ;;
2) clear ; trialvmess ; exit ;;
3) clear ; renew-ws ; exit ;;
4) clear ; del-ws ; exit ;;
5) clear ; cek-ws ; exit ;;
6) clear ; log-vmess ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo "Tekan Yang Bener Dlogok" ; sleep 1 ; m-vmess ;;
esac