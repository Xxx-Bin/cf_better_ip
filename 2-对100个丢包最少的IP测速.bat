@echo off
setlocal enabledelayedexpansion
RD /S /Q temp
mkdir temp
cls
set sleep=500
set maxtime=10
set /p sleep=进程间隔【默认：%sleep%毫秒】:
set /p maxtime=单进程执行时间【默认：%maxtime%】秒:
echo WScript.sleep !sleep! > sleep.vbs
for /f "tokens=1,2" %%a in ('type "100个丢包最少的IP.txt"') do (
sleep.vbs
start /b curl --resolve speed.cloudflare.com:443:%%a https://speed.cloudflare.com/__down?bytes=1000000000 -o temp/%%a -s --connect-timeout 2 --max-time !maxtime!
echo  正在测试 %%a
)
del sleep.vbs
set /a wait =  maxtime+sleep/1000*100
choice /t !wait !* /d y /n >nul
cd temp
dir /o:-s > ../速度排名1.txt
choice /t 3 /d y /n >nul
RD /S /Q temp
start 速度排名1.txt
RD /S /Q temp