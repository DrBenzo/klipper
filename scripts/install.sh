#!/bin/bash

# Установка Docker если он не установлен
if ! command -v docker &> /dev/null; then
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
fi

# Установка Docker Compose если он не установлен
if ! command -v docker-compose &> /dev/null; then
    sudo curl -L "https://github.com/docker/compose/releases/download/v2.20.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
fi

# Создание необходимых директорий
mkdir -p config

# Добавление текущего пользователя в группу docker
sudo usermod -aG docker $USER

echo "Установка завершена. Пожалуйста, перезагрузите систему." 