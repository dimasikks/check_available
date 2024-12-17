#!/bin/bash
#made by dimasikks

#=========================BASED_INFO================================#
#TEXT_LIMITER
text_limiter_main="|===============================================|"
text_limiter_msg="|      "
text_limiter_err=$(echo -e "\n$text_limiter_msg \n$text_limiter_main")

echo "$text_limiter_main"
echo "$text_limiter_msg"

hosts_file="./hosts.txt" #you can choose your path to hosts.txt

if [ ! -f "$hosts_file" ]; then
	echo -e "$text_limiter_msg hosts.txt file not found! Stopped . . . $text_limiter_err"
	exit 1
fi

if [ ! $# -eq 0 ]; then
	choice=$1
fi
#===================================================================#

if [ -z "$choice" ]; then
	read -p "$text_limiter_msg Choose operation (1 [check] - check available hosts, 2 [ssh] - log in each host in hosts.txt and do something): " choice
fi

#insert some your words into choices for fast using this script
choice_1=("check" "available") 
choice_2=("log" "ssh" "do" "login")
to_do=0

#============================CHECK_CHOICE===========================#
if [ "$choice" == 1 ]; then
	to_do=1
else
	for item in "${choice_1[@]}";
		do
		if [ $(echo "$choice" | grep "$item" | wc -l) -gt 0 ]; then
			to_do=1
		fi
	done
	if [ "$to_do" == 0 ]; then
		if [ "$choice" == 2 ]; then
			to_do=2
		else
			for item in "${choice_2[@]}";
			do
			if [ $(echo "$choice" | grep "$item" | wc -l) -gt 0 ]; then
				to_do=2
			fi done
		fi
	fi

	if [ "$to_do" == 0 ]; then
		echo -e "$text_limiter_msg Wrong input! Stopped . . . $text_limiter_err"
		exit 1
	fi

fi

#===================================================================#
if [ "$to_do" == 1 ]; then echo "1"
else echo "2"
fi

