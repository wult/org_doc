#!/bin/bash
function menu_apps()  {
clear
cat<<EOF
					#常用菜单
			1. chrome
			2. forticlient
			3. 退出
EOF
  echo -en "\t\t请输入"
  read -n 1 appsList
	case $appsList in 
		1)
				nohup chromium-browser %U --ignore-gpu-blacklist  >/dev/null 2>&1 &
				clear ;;
		2)
			
				sh /opt/forticlient-sslvpn/forticlientsslvpn.sh &
				clear;;
		3)
				break
				;;
		*)
			continue
			;;
	esac

}
