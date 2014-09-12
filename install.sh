#!/bin/bash

#specify a different home
#$HOME="path/to/home"

programs=( vim git tmux zsh conky "wget" )
myzsh_default="gentoo"

configs[0]="https://raw.githubusercontent.com/ngodfraind/conf/master/.tmux.conf"
configs[1]="https://raw.githubusercontent.com/ngodfraind/conf/master/.vimrc"
configs[2]="https://raw.githubusercontent.com/ngodfraind/conf/master/.conkyrc"

#path starting from home
targets[0]="/"
targets[1]="/"
targets[2]="/"

#we need git & wget at the very least but it doesn't make sense if the others are not present
for name in ${programs[@]}; do
    command -v $name >/dev/null 2>&1 || { echo "I require $name but it's not installed. Aborting." >&2; exit 1; }
done

#installing oh-my-zsh
wget --no-check-certificate http://install.ohmyz.sh -O - | sh

#changing oh-my-zsh default
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="'$myzsh_default'"/g' $HOME/.zshrc

#loading config files
for (( i = 0 ; i < ${#configs[@]} ; i++ )) do
    wget ${configs[$i]} -P $HOME${targets[$i]}
done

#run conky on startup (usually .xinitrc)
echo -e "\e[0;34mDon't forget to run conky on startup: conky -c $HOME/.conkyrc\e[0m"
