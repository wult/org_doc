#!/bin/bash
function menu_git()  {
clear
cat<<EOF
					#git 菜单
			1. org_doc pull
			2. org_doc commit
			z. 退出
EOF
  echo -en "\t\t请输入"
  read -n 1 appsList
	case $appsList in 
		1)
				cd $ORG_DOC_HOME
				git pull
				clear ;;
		2)
				cd $ORG_DOC_HOME
				git add -A
				git commit -m "commit"
				git push
				clear;;
		z)
				break
				;;
		*)
			continue
			;;
	esac

}
