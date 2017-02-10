Set oShell = WScript.CreateObject("WScript.Shell")
oShell.Run "bash -c '/home/`whoami`/chatwars/tg/scripts/automate.sh defence &'", 0, False