#!/bin/bash
MYIP=$(curl -sS ipv4.icanhazip.com)
echo "WELCOME TO ZEN AREA"
#########################
# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[36m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# VPS Information
#Domain
domain=$(cat /etc/xray/domain)
#Status certificate
modifyTime=$(stat $HOME/.acme.sh/${domain}_ecc/${domain}.key | sed -n '7,6p' | awk '{print $2" "$3" "$4" "$5}')
modifyTime1=$(date +%s -d "${modifyTime}")
currentTime=$(date +%s)
stampDiff=$(expr ${currentTime} - ${modifyTime1})
days=$(expr ${stampDiff} / 86400)
remainingDays=$(expr 90 - ${days})
tlsStatus=${remainingDays}
if [[ ${remainingDays} -le 0 ]]; then
	tlsStatus="expired"
fi
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

today=`date -d "0 days" +"%Y-%m-%d"`

# CERTIFICATE STATUS
d1=$(date -d "$exp" +%s)
d2=$(date -d "$today" +%s)
certificate=$(( (d1 - d2) / 86400 ))
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
# usage
vnstat_profile=$(vnstat | sed -n '3p' | awk '{print $1}' | grep -o '[^:]*')
vnstat -i ${vnstat_profile} >/root/t1
bulan=$(date +%b)
today=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $8}')
todayd=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $8}')
today_v=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $9}')
today_rx=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $2}')
today_rxv=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $3}')
today_tx=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $5}')
today_txv=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $6}')
dmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $2" "substr ($3, 1 ,3)}')"
umon="$(vnstat -m | grep `date +%G-%m` | awk '{print $5" "substr ($6, 1 ,3)}')"
tmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $8" "substr ($9, 1 ,3)}')"
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
ISP=$(cat /usr/local/etc/xray/org)
CITY=$(cat /usr/local/etc/xray/city)
WKT=$(cat /usr/local/etc/xray/timezone)
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
#Status Service Menu
cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
nginx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$nginx" = "active" ]; then
sttsnginx="${green}ON${NC}"
else
sttsnginx="${red}OFF${NC}"
fi
xray=$(service xray status | grep active | cut -d ' ' $stat)
if [ "$xray" = "active" ]; then
sttsxray="${green}ON${NC}"
else
sttsxray="${red}OFF${NC}"
fi
clear 
echo -e "${CYAN}┌─────────────────────────────────────────────────┐${NC}"
echo -e "              ${BLUE} • SERVER INFORMATION • ${NC}                "
echo -e "${CYAN}└─────────────────────────────────────────────────┘${NC}"
echo -e "\e[36m OS            \e[0m:  "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`
echo -e "\e[36m ISP           \e[0m:  $ISP"
echo -e "\e[36m IP VPS        \e[0m:  $IPVPS"
echo -e "\e[36m Domain        \e[0m:  $domain"
echo -e "\e[36m Region        \e[0m:  $CITY"
echo -e "\e[36m Waktu         \e[0m:  $WKT"
echo -e "\e[36m System Uptime \e[0m:  $uptime"			
echo -e "\e[36m RAM Usage     \e[0m:  $uram MB | $tram MB"
echo -e "${RED}┌─────────────────────────────────────────────────┐${NC}"
echo -e "\e[36m             Nginx Status  \e[0m:  [ $sttsnginx ]"
echo -e "\e[36m             Xray Status   \e[0m:  [ $sttsxray ]"
echo -e "     ${RED}——————————————————————————————————————${NC}"
echo -e "         ${BLUE} Bandwidth Monitoring Hari Ini${NC}"
echo -e "     ${RED}——————————————————————————————————————${NC}"
echo -e "               ${BLUE} Down ${NC}  : $today_rx $today_rxv"
echo -e "               ${BLUE} Up ${NC}    : $today_tx $today_txv"
echo -e "               ${BLUE} Total ${NC} : $todayd $today_v"
echo -e "${RED}└─────────────────────────────────────────────────┘${NC}"
echo -e "${CYAN}┌─────────────────────────────────────────────────┐${NC}"
echo -e "              ${BLUE} • XRAY Lite Premium • ${NC}                "
echo -e "${CYAN}└─────────────────────────────────────────────────┘${NC}"
echo -e   ""
echo -e " [\e[36m 01 \e[0m] Menu XRAY Vmess  | [\e[36m 05 \e[0m] Menu VPS & System"
echo -e " [\e[36m 02 \e[0m] Menu XRAY Vless  | [\e[36m 06 \e[0m] Status & Info Service"
echo -e " [\e[36m 03 \e[0m] Menu XRAY Trojan | [\e[36m 07 \e[0m] Backup dan Restore"
echo -e " [\e[36m 04 \e[0m] Menu Shadowsocks | [\e[36m 08 \e[0m] Service Monitoring"
echo -e   ""
echo -e " [\e[36m 77 \e[0m] Clear RAM Cache"
echo -e " [\e[36m 88 \e[0m] Clear Log Xray"
echo -e   ""
echo -e   " Press x or [ Ctrl+C ] • To-Exit-Script"
echo -e   ""
echo -e "${RED}┌─────────────────────────────────────────────────┐${NC}"
echo -e "   \e[36mClient Name     \e[0m: Zenvio"
echo -e "   \e[36mExpired         \e[0m: Lifetime"
echo -e "   \e[36mVersion         \e[0m: V 3.0 Xray Lite"
echo -e "   \e[36mAuthor          \e[0m: ZenVPN"
echo -e "   \e[36mWhatsapp        \e[0m: 081977814343"
echo -e "   \e[36mTelegram        \e[0m: t.me/zenvio"
echo -e "${RED}└─────────────────────────────────────────────────┘${NC}"
echo -e   ""
read -p " Select menu :  "  opt
echo -e   ""
case $opt in
1) clear ; m-vmess ;;
2) clear ; m-vless ;;
3) clear ; m-trojan ;;
4) clear ; m-ssws ;;
5) clear ; m-system ;;
6) clear ; running ;;
7) clear ; menu-backup ;;
8) clear ; gotop ;;
77) clear ; clearcache ;;
88) clear ; cleaner ;;
x) exit ;;
*) echo "Wrong Number Key " ; sleep 1 ; menu ;;
esac
