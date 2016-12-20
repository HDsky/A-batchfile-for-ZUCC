@echo off
COLOR B9
CLS
:init
setlocal DisableDelayedExpansion
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion
:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )
:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
ECHO.
ECHO ********************************
ECHO 请求 UAC 权限批准……
ECHO ********************************
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /B
:gotPrivileges
setlocal & pushd .
cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

ECHO. ===========================================================================================
ECHO.                                  南校区内外网同时访问
ECHO.                                                            作者：黑^&蛋       版本：V07
ECHO. 使用说明：
ECHO. 本程序适用于ZUCC南校区所有学生寝室(明德3除外)，可使电脑在不用中断宽带连接的情况下访问内网。
ECHO. 每次需要内外网同时访问前请使用本程序。
ECHO. 目前仅支持win7及以上简体中文系统，新版本支持一键提权+自动设置-。-
ECHO. 版本说明：
ECHO. 很高兴的通知在上个版本中抽风的提权模块又回来了0.0（当然是治好了）
ECHO. 如有需要请访问 https://hdsky.pw/   尝试按教程设置开机启动
ECHO. 发现问题请及时联系hd852025@hotmail.com提供帮助，偶然瞄到我会回复的。
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
echo %%i|findstr /c:"默认网关"  && (set "t= %%i" & goto :DEAL)
)
)

:DEAL
for /f "tokens=2 delims=:" %%i in ("%t%") do echo %%i >> Gateway.txt
echo	成功提取！
set/p var=<Gateway.txt
echo %var%
route add 10.0.0.0 mask 255.0.0.0%var%
route add 210.32.0.0 mask 255.255.240.0%var%
route add 210.32.128.0 mask 255.255.192.0%var%
route add 222.205.0.0 mask 255.255.128.0%var%
echo  设置DNS地址ing....
Netsh interface IP Set dns "ZUCC" static 114.114.114.114 primary
Netsh interface IP add dns "ZUCC" 10.61.10.10
ipconfig /flushdns
Echo  设置成功 
goto END

:END
del Gateway.txt
del ipconfig.txt
pause