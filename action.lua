function on_msg_receive (msg)
  if msg.out then
    return
  end

  math.randomseed(os.time())
  random_number = math.random(5,60)

  if string.find(msg.text, '/go') and msg.from.username == 'ChatWarsBot' then
    sleep(random_number)
    send_msg(msg.from.id, '/go', ok_cb, false)
  end
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
