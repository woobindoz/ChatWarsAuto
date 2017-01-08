# ChatWarsAuto
Скрипты для автоматизации защиты и квестов через [telegram-cli](https://github.com/vysheng/tg).
* __go.lua__ - lua-скрипт, автоматически отвечает `/go`
* __go+att.lua__ - помимо `/go`, позвляет управлять администраторам атакой на замки
* __cron.sh__ - добавляет в crontab задачу раз в 3 часа вставать в защиту и с 3 утра до 6 каждые 10 минут ходить в корованы 
* __automate.sh__ - bash-сприпт, с параметрами `defence`, `caravan`, `forest`, `go` запускает telegram-cli
* __first.sh__ - скрипт для базовой настройки окружения Ubuntu/Debian
