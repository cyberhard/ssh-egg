#!/bin/bash

# Получаем значения переменных из окружения
SERVER_PORT="$1"
USER="$2"
PASSWORD="$3"

# Установка SSH-сервера и необходимых зависимостей
apt-get update
apt-get install -y openssh-server

# Настройка SSH-сервера с использованием переменных
sed -i "s/#Port 22/Port $SERVER_PORT/" /etc/ssh/sshd_config
# Другие настройки SSH-сервера, если необходимо

# Создание пользователя
useradd -m "$USER"
echo "$USER:$PASSWORD" | chpasswd

# Запуск SSH-сервера
service ssh start

# Дополнительные действия, если необходимо
