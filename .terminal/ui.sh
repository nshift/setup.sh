#!/bin/sh

red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
magenta=`tput setaf 5`
cyan=`tput setaf 6`
white=`tput setaf 7`
reset=`tput sgr0`
source_path="$(dirname $BASH_SOURCE)"

function now {
	echo "[$(date +%H:%M:%S)]: "
}

function separator {
	echo "$(now)${green}----------------------------------------${reset}"
	if [ "${1}" ]; then
		echo "$(now)${green}${1}${reset}"
		separator
	fi
}

function success {
	echo "$(now)${green}${1}${reset}"
}

function message {
	echo "$(now)${blue}${1}${reset}"
}

function important {
	echo -e "$(now)${yellow}${1}${reset}"
}

function note {
	echo "$(now)${yellow}${1}${reset}"
}

function error {
	echo "$(now)${red}${1}${reset}" >&2
	exit 1
}

function step {
	actions+=("${1}")
}

function summary {
	local sep=","
	local action=`printf "${sep}%s" "${actions[@]}"`
	local status=`for ((i = 0; i < ${#actions[@]}; ++i)); do echo "${sep}success"; done | tr -d '\n'`
	ruby "${source_path}/table.rb" -t "${1:-Summary}" -a "${action:${#sep}}" -s "${status:${#sep}}"
}

function finish {
	if [ $? -eq 0 ]; then
		exit 0
	fi
	local sep=","
	local action=`printf "${sep}%s" "${actions[@]}"`
	local last_index=`expr ${#actions[@]} - 1`
	local status=`for ((i = 0; i < ${#actions[@]}; ++i)); do
		if [ $i -eq $last_index ]; then echo "${sep}error"
		else echo "${sep}success"
		fi 
	done | tr -d '\n'`
	ruby "${source_path}/table.rb" -t "${1:-Summary}" -a "${action:${#sep}}" -s "${status:${#sep}}"
}

trap finish EXIT