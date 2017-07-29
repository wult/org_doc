#!/bin/bash
source env.sh
source  apps.sh
source gits.sh
./mysqls.sh
function menu (){
	clear
cat <<EOF
				#系统菜单
				1. firefox
				2. emacs
				3. 常用应用
				4. git 操作
				5. mysql 操作
				6. 关机
				0. 退出菜单系统
EOF
  echo -en "\t\t请输入"
  read -n 1 list
	case $list in 
		0)
            break ;;
		1)
            nohup firefox >/dev/null 2>&1 &
			clear;;
		2)
            nohup emacs   >/dev/null 2>&1 &
            clear ;;
		3)
			menu_apps
			;;
		4)
			menu_git
			;;
		5)
				menu_mysql
			;;
		6)
            sudo shutdown -h now
            break ;;
		0)
			echo -e "退出..."
			sleep 1
			exit 0
			clear
			;;
		*)
			continue 
			;;
	esac
}

#入口函数
function main () {
	while true
	do
		menu
	done
}

main
