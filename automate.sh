#!/bin/bash
cd /home/`whoami`/tg
state="$1"
if [[ $state = "defence" ]]
	then (sleep 1; echo "contact_list"; sleep 1; echo "msg user#265204902 '🇻🇦'") | bin/telegram-cli -W -v -k tg-server.pub
fi
if [[ $state = "caravan" ]]
	then (sleep 1; echo "contact_list"; sleep 1; echo "msg user#265204902 '🐫ГРАБИТЬ КОРОВАНЫ'") | bin/telegram-cli -W -v -k tg-server.pub
fi
if [[ $state = "forest" ]]
	then (sleep 1; echo "contact_list"; sleep 1; echo "msg user#265204902 '🌲Лес'") | bin/telegram-cli -W -v -k tg-server.pub
fi
if [[ $state = "cave" ]]
	then (sleep 1; echo "contact_list"; sleep 1; echo "msg user#265204902 '🕸Пещера'") | bin/telegram-cli -W -v -k tg-server.pub
fi
if [[ $state = "arena" ]]
	then (sleep 1; echo "contact_list"; sleep 1; echo "msg user#265204902 '🔎Поиск соперника'") | bin/telegram-cli -W -v -k tg-server.pub
fi
if [[ $state = "go" ]]
	then bin/telegram-cli -W -v -k tg-server.pub -s scripts/go.lua
fi
if [[ $state = "go-att" ]]
	then bin/telegram-cli -W -v -k tg-server.pub -s scripts/go+att.lua
fi
if [[ $state = "go-helper" ]]
	then (sleep 1; echo "contact_list"; sleep 1; echo "msg user#265204902 '/go'") | bin/telegram-cli -W -v -k tg-server.pub
fi
