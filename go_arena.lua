function on_msg_receive (msg)
    if msg.out then
        return
    end
	if msg.text==nil then
		return
	end
	math.randomseed(os.time())
     
	random_go = math.random(15,50)
	random_choice = math.random(1,3) --для арены время ожидания поменьше (оно же и выбор места)
	
	atack='🗡в голову'
	def='🛡головы'
	
	if random_choice == 2 then 
		atack='🗡по корпусу'
		def='🛡корпуса'
    elseif random_choice == 3 then 
		atack='🗡по ногам'
		def='🛡ног'	
	end

    if string.find(msg.text, 'выбери точку атаки и точку защиты.') and msg.from.username == 'ChatWarsBot' then
		sleep(random_choice)
        send_msg('user#id265204902', atack, ok_cb, false)
		return
    end
	if string.find(msg.text, 'Хорошо! Осталось определиться с защитой!') and msg.from.username == 'ChatWarsBot' then
		sleep(random_choice)
        send_msg('user#id265204902', def, ok_cb, false)
		return
    end

	if string.find(msg.text, '/go') and msg.from.username == 'ChatWarsBot' then
		sleep(random_go)
        send_msg('user#id265204902', '/go', ok_cb, false)
		return
    end

	--Кеша чирикнул "щит"
	--if string.find(msg.text, '🛡') and msg.from.username == 'ChatWarsStatBot' then
	--	sleep(random_choice)
    --    send_msg('user#id265204902', '🇻🇦', ok_cb, false)
	--	return
    --end

	--пересылка флага от бота. Не всегда срабатывает
	--if (msg.text=='🛡 Защита' or msg.text=='🇪🇺' or msg.text=='🇬🇵' or msg.text=='🇮🇲' or msg.text=='🇨🇾' or msg.text=='🇻🇦') and msg.from.username == 'ChatWarsStatBot' then
	--	sleep(random_choice)
    --    send_msg('user#id265204902', msg.text, ok_cb, false)
	--	return
    --end

end


function sleep(n)
  os.execute("sleep " .. tonumber(n))
end

function on_our_id (id)
end

function on_secret_chat_created (peer)
end

function on_user_update (user)
end

function on_chat_update (user)
end

function on_get_difference_end ()
end

function on_binlog_replay_end ()
end

function ok_cb() 
end