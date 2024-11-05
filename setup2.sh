#!/bin/bash
echo_color() {
    echo -e "\033[1;32m$1\033[0m"  # Зеленый цвет
}
# Установка темы zsh
echo_color "Установка темы zsh..."
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="gentoo"/g' ~/.zshrc

# Установка настроек vim
echo_color "Установка настроек vim..."
mv .vimrc ~/.vimrc
mv .vim ~/.vim
