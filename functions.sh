#!/usr/bin/env bash
command_exists () {
    type "$1" &> /dev/null ;
}


detect_os () {

    ## OS and Architecture

    if [ -f /etc/os-release ]; then
        # freedesktop.org and systemd
        . /etc/os-release
        OS=$NAME
        VER=$VERSION_ID
    elif type lsb_release >/dev/null 2>&1; then
        # linuxbase.org
        OS=$(lsb_release -si)
        VER=$(lsb_release -sr)
    elif [ -f /etc/lsb-release ]; then
        # For some versions of Debian/Ubuntu without lsb_release command
        . /etc/lsb-release
        OS=$DISTRIB_ID
        VER=$DISTRIB_RELEASE
    elif [ -f /etc/debian_version ]; then
        # Older Debian/Ubuntu/etc.
        OS=Debian
        VER=$(cat /etc/debian_version)
    elif [ -f /etc/SuSe-release ]; then
        # Older SuSE/etc.
        ...
    elif [ -f /etc/redhat-release ]; then
        # Older Red Hat, CentOS, etc.
        ...
    else
        # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
        OS=$(uname -s)
        VER=$(uname -r)
    fi

}


# @see https://github.com/kepkin/dev-shell-essentials/blob/master/highlight.sh
highlight() {
    declare -A fg_color_map
    fg_color_map[black]=30
    fg_color_map[red]=31
    fg_color_map[green]=32
    fg_color_map[yellow]=33
    fg_color_map[blue]=34
    fg_color_map[magenta]=35
    fg_color_map[cyan]=36

    fg_c=$(echo -e "\e[1;${fg_color_map[$1]}m")
    c_rs=$'\e[0m'
    sed -u s"/$2/$fg_c\0$c_rs/g"
}


setup_lsi () {

    if [ "$(command_exists 'ls-i')" = 0 ];
    then
        LS_COLORS=$(ls_colors_generator)

        run_ls() {
            ls-i --color=auto -w $(tput cols) "$@"
        }

        run_dir() {
            dir-i --color=auto -w $(tput cols) "$@"
        }

        run_vdir() {
            vdir-i --color=auto -w $(tput cols) "$@"
        }
        alias ls="run_ls"
        alias dir="run_dir"
        alias vdir="run_vdir"/
    fi
}


grepc()
{
    pattern=$1
    shift
    if [ ! -z $2 ]; then
    esc=$(printf "\0\$2")
    shift
    else
    esc=$(printf "\033")
    fi
    sed -E 's"'"$pattern"'"'$esc'[32m&'$esc'[0m"g' "$@"
}


histcmd() {
    fc -l 1 |  awk '{line=$1; $1=""; CMD_LINE[$0]=line; CMD[$0]++;count++; for (a in CMD)print CMD[a] " " CMD_LINE[a] " " a;}' | sort -rn 
}


function r()
{
    source $HOME/.zshrc
}


function validate-yml()
{
	#!/bin/bash

	#
	# Efstathios Xagoraris <sxagoraris@gmail.com>
	# Validate YAML files using ruby
	#


	if [ $# -eq 0 ]
	  then
		echo "Please provide a yaml file as argument eg $0 file.yaml"
		exit 1
	fi

	ruby -ryaml -e "YAML.parse(File.open('${1}'))"

	if [[ $? -ne 0 ]]
	  then
		echo "$1 is not valid YAML"
	  else
		echo "$1 is a valid YAML"
	fi
}
