#!/bin/bash
#Install Gotop
cd /usr/bin
git clone --depth 1 https://github.com/cjbassi/gotop /tmp/gotop
/tmp/gotop/scripts/download.sh
mv /tmp/gotop /usr/bin
chmod +x gotop.sh
menu
