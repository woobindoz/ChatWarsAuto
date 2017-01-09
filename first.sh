#!/bin/bash

# Обработка Ctrl+C
trap finish INT

echo "Скрипт инициализирован."
# Переход в нужную директорию
cd /home/`whoami`

# Обновляем источники
echo "Обновление источников..."
bash -c "sudo apt-get update 1> /dev/null"
echo -e "\e[32mИсточники обновлены.\e[0m"

# Обновляем систему
echo "Обновление системы..."
bash -c "sudo apt-get upgrade -y 1> /dev/null"
echo -e "\e[32mСистема обновлена.\e[0m"

# Устанавливаем зависимости и git
echo "Установка зависимостей..."
bash -c "sudo apt-get install -y libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev libjansson-dev libpython-dev make git 1> /dev/null"
echo -e "\e[32mЗависимости и git установлены.\e[0m"

# Загружаем telegram-cli
echo "Начата загрузка telegram-cli..."
{
  git clone --recursive https://github.com/vysheng/tg.git
  git clone https://github.com/Lord-Protector/ChatWarsAuto.git tg/scripts
} &> /dev/null
echo -e "\e[32mЗагрузка завершена.\e[0m"
cd tg

# Сборка
echo "Начата сборка..."
{
  ./configure
  make
} &> /dev/null
echo -e "\e[32mСборка завершена.\e[0m"

# Сохраняем текущие задачи
echo "Добавление задач..."
crontab -l > currentjobs

# Добавляем новые задачи
echo "50 */3 * * * `pwd`/scripts/automate.sh defence" >> currentjobs
echo "10,20,30,40 4-6 * * * `pwd`/scripts/automate.sh caravan" >> currentjobs
crontab currentjobs

# Удаляем временный файл
rm currentjobs
echo -e "\e[32mЗадачи в cron добавлены.\e[0m"

# Создание systemd задачи
echo "Создание systemd-демона..."
{
  sudo sh -c "sudo echo -e '[Unit]\nDescription=Telegram CLI daemon\nWants=network.target\nAfter=network.target\n\n[Install]\nWantedBy=default.target\n\n[Service]\nType=simple\nUser=`whoami`\nExecStart=/home/`whoami`/tg/bin/telegram-cli --wait-dialog-list -v --disable-auto-accept --disable-readline --disable-colors --rsa-key=/home/`whoami`/tg/tg-server.pub --lua-script=/home/`whoami`/tg/scripts/go.lua --logname=/var/log/telegramd.log --tcp-port=7313 --daemonize\nKillSignal=SIGKILL\nKillMode=process\nRestart=on-failure' > /etc/systemd/system/telegram.service"
  bash -c "sudo systemctl daemon-reload"
  bash -c "sudo systemctl restart telegram"
  bash -c "sudo systemctl status telegram"
  bash -c "sudo systemctl enable telegram"
} &> /dev/null
echo -e "\e[32msystemd-демон создан.\e[0m"

# Инициализация с автовыходом
echo "Выполните вход в аккаунт!"
bin/telegram-cli -D -e 'quit'
