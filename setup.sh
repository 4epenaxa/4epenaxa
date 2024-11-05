#!/bin/bash

# Функция для вывода сообщений с цветом
echo_color() {
    echo -e "\033[1;32m$1\033[0m"  # Зеленый цвет
}
# Обновление системы
echo_color "Обновление системы..."
apt update && apt upgrade -y

# Установка необходимых пакетов
echo_color "Установка пакетов для установки Docker..."
apt install -y apt-transport-https ca-certificates curl software-properties-common

# Установка Docker
echo_color "Установка Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt update
apt install -y docker-ce

# Установка Docker Compose
echo_color "Установка Docker Compose..."
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Установка zsh
echo_color "Установка zsh"
apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Добавляем пользоваетля
useradd jhinelia
usermod -aG sudo jhinelia
usernod -aG docker jhinelia
passwd jhinelia
