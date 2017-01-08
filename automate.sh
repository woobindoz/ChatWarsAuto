#!/bin/bash
cd `pwd`
state="$1"
if [[ $state = "defence" ]]
	then (sleep 1; echo "contact_list"; sleep 1; echo "msg user#265204902 '🛡 Защита'") | bin/telegram-cli -W -v -k tg-server.pub
fi
if [[ $state = "caravan" ]]
	then (sleep 1; echo "contact_list"; sleep 1; echo "msg user#265204902 '🐫ГРАБИТЬ КОРОВАНЫ'") | bin/telegram-cli -W -v -k tg-server.pub
fi
if [[ $state = "forest" ]]
	then (sleep 1; echo "contact_list"; sleep 1; echo "msg user#265204902 '🌲Лес'") | bin/telegram-cli -W -v -k tg-server.pub
fi
if [[ $state = "go" ]]
	then bin/telegram-cli -W -v -k tg-server.pub -s scripts/action.lua
fi
