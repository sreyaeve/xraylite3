#!/bin/bash
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'
yl='\e[32;1m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
# Getting
# IP Validation
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

MYIP=$(curl -sS ipinfo.io/ip)

red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
clear

# GETTING OS INFORMATION
source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID

# VPS ISP INFORMATION
#ITAM='\033[0;30m'
echo -e "$ITAM"
REGION=$( curl -s ipinfo.io/region )
#clear
#COUNTRY=$( curl -s ipinfo.io/country )
#clear
#WAKTU=$( curl -s ipinfo.ip/timezone )
#clear
CITY=$( curl -s ipinfo.io/city )
#clear
#REGION=$( curl -s ipinfo.io/region )
#clear

# CHEK STATUS 
tls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nontls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_tls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_nontls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
shadowsocks=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
trojan_server=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vnstat_service=$(/etc/init.d/vnstat status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
cron_service=$(/etc/init.d/cron status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
fail2ban_service=$(/etc/init.d/fail2ban status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

# COLOR VALIDATION
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
clear

# STATUS SERVICE  NGINX
if [[ $nginx_service == "running" ]]; then 
   nginx_status=" ${GREEN}Running ${NC}( No Error )"
else
   nginx_status="${RED}  Not Running ${NC}  ( Error )"
fi

# STATUS SERVICE  VNSTAT 
if [[ $vnstat_service == "running" ]]; then 
   status_vnstat=" ${GREEN}Running ${NC}( No Error )"
else
   status_vnstat="${RED}  Not Running ${NC}  ( Error )"
fi

# STATUS SERVICE  CRONS 
if [[ $cron_service == "running" ]]; then 
   status_cron=" ${GREEN}Running ${NC}( No Error )"
else
   status_cron="${RED}  Not Running ${NC}  ( Error )"
fi

# STATUS SERVICE  FAIL2BAN 
if [[ $fail2ban_service == "running" ]]; then 
   status_fail2ban=" ${GREEN}Running ${NC}( No Error )"
else
   status_fail2ban="${RED}  Not Running ${NC}  ( Error )"
fi

# STATUS SERVICE  TLS 
if [[ $tls_v2ray_status == "running" ]]; then 
   status_tls_v2ray=" ${GREEN}Running${NC} ( No Error )"
else
   status_tls_v2ray="${RED}  Not Running${NC}   ( Error )"
fi

# STATUS SERVICE NON TLS V2RAY
if [[ $nontls_v2ray_status == "running" ]]; then 
   status_nontls_v2ray=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   status_nontls_v2ray="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE VLESS HTTPS
if [[ $vless_tls_v2ray_status == "running" ]]; then
  status_tls_vless=" ${GREEN}Running${NC} ( No Error )"
else
  status_tls_vless="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE VLESS HTTP
if [[ $vless_nontls_v2ray_status == "running" ]]; then
  status_nontls_vless=" ${GREEN}Running${NC} ( No Error )"
else
  status_nontls_vless="${RED}  Not Running ${NC}  ( Error )${NC}"
fi
# STATUS SERVICE TROJAN
if [[ $trojan_server == "running" ]]; then 
   status_virus_trojan=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   status_virus_trojan="${RED}  Not Running ${NC}  ( Error )${NC}"
fi
# STATUS SERVICE DROPBEAR
if [[ $dropbear_status == "running" ]]; then 
   status_beruangjatuh=" ${GREEN}Running${NC} ( No Error )${NC}"
else
   status_beruangjatuh="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE STUNNEL
if [[ $stunnel_service == "running" ]]; then 
   status_stunnel=" ${GREEN}Running ${NC}( No Error )"
else
   status_stunnel="${RED}  Not Running ${NC}  ( Error )}"
fi

# STATUS SHADOWSOCKS
if [[ $shadowsocks == "running" ]]; then 
   status_shadowsocks=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   status_shadowsocks="${RED}  Not Running ${NC}  ( Error )${NC}"
fi
# TOTAL RAM
total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
totalram=$(($total_ram/1024))

# KERNEL TERBARU
kernelku=$(uname -r)

# DNS PATCH
#tipeos2=$(uname -m)
# GETTING DOMAIN NAME
Domen="$(cat /etc/xray/domain)"
echo -e ""
echo -e "${CYAN}┌─────────────────────────────────────────────────┐${NC}"
echo -e "\E[31;1;39m                  ⇱ INFORMATION ⇲            \E[0m"
echo -e "${CYAN}└─────────────────────────────────────────────────┘${NC}"
echo -e "${RED}┌─────────────────────────────────────────────────┐${NC}"
echo -e "   ⚡ OS Name     : $Tipe"
echo -e "   ⚡ Public IP   : $MYIP"
echo -e "   ⚡ Domain      : $Domen"
echo -e "   ⚡ Client Name : Zenvio"
echo -e "   ⚡ Exp Script  : Lifetime"
echo -e "   ⚡ Version     : XRAY LITE V 2.0"
echo -e "${RED}└─────────────────────────────────────────────────┘${NC}"
echo -e "${CYAN}┌─────────────────────────────────────────────────┐${NC}"
echo -e "\E[31;1;39m                ⇱ SERVICE STATUS ⇲             \E[0m"
echo -e "${CYAN}└─────────────────────────────────────────────────┘${NC}"
echo -e "${RED}┌─────────────────────────────────────────────────┐${NC}"
echo -e "   ⚡ Nginx                 :$nginx_status"
echo -e "   ⚡ Fail2Ban              :$status_fail2ban"
echo -e "   ⚡ Crons                 :$status_cron"
echo -e "   ⚡ XRAYS Vmess           :$status_tls_v2ray"
echo -e "   ⚡ XRAYS Vless           :$status_tls_vless"
echo -e "   ⚡ XRAYS Trojan          :$status_virus_trojan"
echo -e "   ⚡ Shadowsocks           :$status_shadowsocks"
echo -e "${RED}└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
