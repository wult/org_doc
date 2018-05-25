#!/bin/bash
function menu_apps()  {
clear
cat<<EOF
					#常用菜单
			1. chrome
			2. forticlient
			3. remmina
			0. 退出
EOF
  echo -en "\t\t请输入"
  read -n 1 appsList
	case $appsList in 
		1)
				nohup chromium-browser %U --ignore-gpu-blacklist  >/dev/null 2>&1 &
				clear ;;
		2)
			
				cd  /opt/forticlient-sslvpn/64bit/
				./forticlientsslvpn_cli --server vpn2-gz.vipshop.com:443 --vpnuser liantian.wu --keepalive
				clear;;
		3)
			
				nohup remmina  >/dev/null 2>&1 &
				clear;;
		0)
				break
				;;
		*)
			continue
			;;
	esac

}
