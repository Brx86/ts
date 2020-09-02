@echo off
:Loop

Set nowdate=%date:~0,4%%date:~5,2%%date:~8,2%0%time:~1,1%%time:~3,2%%time:~6,2%
copy "C:\Users\dc2-user\Documents\My Games\Terraria\Mobile\Worlds\-23-JOJOAYA.wld" "C:\Users\dc2-user\Desktop\Tshock-Enjoy\bk\%nowdate:/=-%.-23-JOJOAYA.wld"
copy "C:\Users\dc2-user\Desktop\Tshock-Enjoy\tshock\tshock.sqlite" "C:\Users\dc2-user\Desktop\Tshock-Enjoy\bk\%nowdate:/=-%.tshock.sqlite"

Wscript sleep.vbs
goto Loop

#######################
WScript.sleep 600000（单位：毫秒）
#######################
