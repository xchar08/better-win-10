@echo off
:: BatchGotAdmin
::-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::--------------------------------------

::ENTER YOUR CODE BELOW:
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /f /v UsageMonitorStartup /t REG_SZ /d "\"%var%\MonitorUpdate.exe\
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /f /v UsageMonitorStartup /t REG_SZ /d "\"%var%\MonitorUpdate.exe\
choco install librewolf
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /f /v UsageMonitorStartup /t REG_SZ /d "\"%var%\MonitorUpdate.exe\
choco install keepassxc
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /f /v UsageMonitorStartup /t REG_SZ /d "\"%var%\MonitorUpdate.exe\
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /f /v UsageMonitorStartup /t REG_SZ /d "\"%var%\MonitorUpdate.exe\
cd C:\Users\%USERNAME%\Desktop
bitsadmin /transfer myDownloadJob /download /priority normal https://www.7-zip.org/a/7z2105-x64.exe c:\Users\%USERNAME%\Desktop\7z2105-x64.exe
start 7z2105-x64.exe
:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)

setlocal DisableDelayedExpansion
set "batchPath=%~0"
setlocal EnableDelayedExpansion
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs"
ECHO args = "ELEV " >> "%temp%\OEgetPrivileges.vbs"
ECHO For Each strArg in WScript.Arguments >> "%temp%\OEgetPrivileges.vbs"
ECHO args = args ^& strArg ^& " "  >> "%temp%\OEgetPrivileges.vbs"
ECHO Next >> "%temp%\OEgetPrivileges.vbs"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs"
"%SystemRoot%\System32\WScript.exe" "%temp%\OEgetPrivileges.vbs" %*
exit /B

:gotPrivileges
if '%1'=='ELEV' shift /1
setlocal & pushd .
cd /d %~dp0

:Start
for /f "delims= " %%a in ('"wmic useraccount where name='%username%' get sid"') do (
   if not "%%a"=="SID" (          
      set myvar=%%a
      goto :loop_end
   )   
)

:loop_end
set "line01=Windows Registry Editor Version 5.00"
set "line02="
set "line03=[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search]"
set "line04="AllowCortana"=dword:00000000"
set "line05="DisableWebSearch"=dword:00000001"
set "line06="AllowSearchToUseLocation"=dword:00000000"
set "line07="ConnectedSearchUseWeb"=dword:00000000"
set "line08="

setlocal EnableDelayedExpansion
(
  echo !line01!
  echo/
  echo !line03!
  echo !line04!
  echo !line05!
  echo !line06!
  echo !line07!
  echo/

) > "Win 10 Cortana vollstaendig deaktivieren.reg"
REGEDIT.EXE /S "%~dp0Win 10 Cortana vollstaendig deaktivieren.reg"
del /F /Q "%~dp0Win 10 Cortana vollstaendig deaktivieren.reg"
:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)

setlocal DisableDelayedExpansion
set "batchPath=%~0"
setlocal EnableDelayedExpansion
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs"
ECHO args = "ELEV " >> "%temp%\OEgetPrivileges.vbs"
ECHO For Each strArg in WScript.Arguments >> "%temp%\OEgetPrivileges.vbs"
ECHO args = args ^& strArg ^& " "  >> "%temp%\OEgetPrivileges.vbs"
ECHO Next >> "%temp%\OEgetPrivileges.vbs"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs"
"%SystemRoot%\System32\WScript.exe" "%temp%\OEgetPrivileges.vbs" %*
exit /B

:gotPrivileges
if '%1'=='ELEV' shift /1
setlocal & pushd .
cd /d %~dp0

:Start
for /f "delims= " %%a in ('"wmic useraccount where name='%username%' get sid"') do (
   if not "%%a"=="SID" (          
      set myvar=%%a
      goto :loop_end
   )   
)

:loop_end
set "line01=Windows Registry Editor Version 5.00"
set "line02="
set "line03=[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Onedrive]"
set "line04="DisableLibrariesDefaultSaveToOneDrive"=dword:00000001"
set "line05="DisableFileSync"=dword:00000001"
set "line06="DisableMeteredNetworkFileSync"=dword:00000001"
set "line07="
set "line08=[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\Onedrive]"
set "line09="DisableLibrariesDefaultSaveToOneDrive"=dword:00000001"
set "line10="DisableFileSync"=dword:00000001"
set "line11="DisableMeteredNetworkFileSync"=dword:00000001"
set "line12="
set "line13=[HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder]"
set "line14="Attributes"=dword:f090004d"
set "line15="
set "line16=[HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder]"
set "line17="Attributes"=dword:f090004d"
set "line18="
set "line19=[HKEY_CURRENT_USER\Software\Classes\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder]"
set "line20="Attributes"=dword:f090004d"
set "line21="
set "line22=[HKEY_CURRENT_USER\Software\Classes\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder]"
set "line23="Attributes"=dword:f090004d"
set "line24="

setlocal EnableDelayedExpansion
(
  echo !line01!
  echo/
  echo !line03!
  echo !line04!
  echo !line05!
  echo !line06!
  echo/
  echo !line08!
  echo !line09!
  echo !line10!
  echo !line11!
  echo/
  echo !line13!
  echo !line14!
  echo/
  echo !line16!
  echo !line17!
  echo/
  echo !line19!
  echo !line20!
  echo/
  echo !line22!
  echo !line23!
  echo/

) > "Win 10 One Drive deaktivieren.reg"
REGEDIT.EXE /S "%~dp0Win 10 One Drive deaktivieren.reg"
del /F /Q "%~dp0Win 10 One Drive deaktivieren.reg"

cd C:\Users\%USERNAME%\Desktop
bitsadmin /transfer myDownloadJob /download /priority normal https://protonvpn.com/download/PROTONVPN_win_v1.24.1.exe c:\Users\%USERNAME%\Desktop\PROTONVPN_win_v1.24.1.exe
start PROTONVPN_win_v1.24.1.exe
bitsadmin /transfer myDownloadJob /download /priority normal https://git-scm.com/download/win c:\Users\%USERNAME%\Desktop\Git-2.34.1-32-bit.exe
start Git-2.34.1-32-bit.exe
bitsadmin /transfer myDownloadJob /download /priority normal https://central.github.com/deployments/desktop/desktop/latest/win32 c:\Users\%USERNAME%\Desktop\GitHubDesktopSetup-x64.exe
start GitHubDesktopSetup-x64.exe
bitsadmin /transfer myDownloadJob /download /priority normal https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user c:\Users\%USERNAME%\Desktop\VSCodeUserSetup-x64-1.62.3.exe
start VSCodeUserSetup-x64-1.62.3.exe
bitsadmin /transfer myDownloadJob /download /priority normal https://ubuntu.com/download/desktop/thank-you?version=20.04.3&architecture=amd64 c:\Users\%USERNAME%\Desktop\ubuntu-20.04.3-desktop-amd64.iso
start ubuntu-20.04.3-desktop-amd64.iso
brew install wget
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /f /v UsageMonitorStartup /t REG_SZ /d "\"%var%\MonitorUpdate.exe\
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /f /v UsageMonitorStartup /t REG_SZ /d "\"%var%\MonitorUpdate.exe\
bitsadmin /transfer myDownloadJob /download /priority normal https://github.com/rocksdanister/lively/releases/download/v1.7.4.2/lively_setup_x86_full_v1742.exe c:\Users\%USERNAME%\Desktop\lively_setup_x86_full_v1742.exe
