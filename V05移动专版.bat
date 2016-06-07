@echo off
COLOR B9
ECHO. ===========================================================================================
ECHO.                      敬告！本程序需要管理员权限运行
ECHO.                                                           作者：黑^&蛋        版本：V05
ECHO. 使用说明：
ECHO. 本程序理论上适用于ZUCC南校区所有学生寝室，可使电脑在不用中断宽带连接的情况下访问内网。
ECHO. 本程序仅用于移动宽带用户，联通用户请自行尝试，电信请索要其他版本。
ECHO. 每次需要用到内外网同时访问前请使用本程序，失效后（重启，重新连接拨号后）如需内外网同时访问需再次使用本程序。
ECHO. 目前支持win7及以上系统，新版本支持一键自动设置-。-
ECHO. 版本说明：
ECHO. V05版本在V03和V04版本的基础上解决了移动运营商DNS劫持的问题，这里值得注意的是如果开启了浏览器的话需重启浏览器！！！
ECHO. 如有需要请联系hd852025@hotmail.com    偶然瞄到我会回复的。
ECHO. ===========================================================================================
pause
for /f "skip=1 tokens=2,3,4,5,6" %%i in ('wmic os get Caption') do set win=%%i%%j
echo 当前系统版本%win%
cd.>Gateway.txt
ipconfig/all>ipconfig.txt

if /i %win%==Windows7 goto Win7
if /i %Win%==Windows8 goto Win10
if /i %Win%==Windows10 goto Win10
if /i %Win%==Windows8.1 goto Win10

:win7
set flag=vsbat
for /f "delims=" %%i in (ipconfig.txt) do (
if  defined flag (
echo "%%i"|findstr /c:"本地连接" && set flag=
) else (
echo %%i|findstr /c:"默认网关"  && (set "t= %%i" & goto :DEAL)
)
)

:win10
set flag=vsbat
for /f "delims=" %%i in (ipconfig.txt) do (
if  defined flag (
echo "%%i"|findstr /c:"以太网" && set flag=
) else (
echo %%i|findstr /c:"默认网关"  && (set "t= %%i" & goto :DELL)
)
)


:DEAL
for /f "tokens=2 delims=:" %%i in ("%t%") do echo %%i >> Gateway.txt
echo	成功提取！
set/p var=<Gateway.txt
echo %var%
route add 10.0.0.0 mask 255.0.0.0%var%
echo  设置DNS地址ing....
Netsh interface IP Set dns "ZUCC" static 10.61.10.10 primary
Netsh interface IP add dns "ZUCC" 114.114.114.114
ipconfig /flushdns
Echo  设置成功 
goto END


:DELL
for /f "tokens=2 delims=:" %%i in ("%t%") do echo %%i >> Gateway.txt
echo	成功提取！
set/p var=<Gateway.txt
echo %var%
route add 10.0.0.0 mask 255.0.0.0%var%
echo  设置DNS地址ing....
Netsh interface IP Set dns "ZUCC" static 10.61.10.10 primary
Netsh interface IP add dns "ZUCC" 114.114.114.114
ipconfig /flushdns
Echo  设置成功 
goto END

:END
del Gateway.txt
del ipconfig.txt
pause