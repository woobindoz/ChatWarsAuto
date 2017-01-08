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

# Инициализация с автовыходом
echo "Выполните вход в аккаунт!"
bash -c "bin/telegram-cli -D -R -e 'quit'"
echo -e "\e[32mВход в аккаунт произведен.\e[0m"

# Сохраняем текущие задачи
echo "Добавление задач..."
crontab -l > currentjobs

# Добавляем новые задачи
echo "50 */3 * * * `pwd`/scripts/automate.sh defence" >> currentjobs
echo "*/10 3-5 * * * `pwd`/scripts/automate.sh caravan" >> currentjobs
crontab currentjobs

# Удаляем временный файл
rm currentjobs
echo -e "\e[32mЗадачи в cron добавлены.\e[0m"
