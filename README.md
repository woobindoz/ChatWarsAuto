# ChatWarsAuto
Скрипты для автоматизации защиты и квестов через [telegram-cli](https://github.com/vysheng/tg).
* def.lua -- lua-скрипт, автоматически отвечает `/go`
* def+att.lua -- помимо `/go`, позвляет управлять администраторам атакой на замки
* cron.sh -- добавляет в crontab задачу раз в 3 часа вставать в защиту и с 3 утра до 6 каждые 10 минут ходить в корованы 
* automate.sh -- bash-сприпт, с параметрами `defence`, `caravan`, `forest`, `go` запускает telegram-cli
* first.sh -- скрипт для базовой настройки окружения Ubuntu/Debian
