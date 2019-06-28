@echo off
:%violet%:
if not defined in_subprocess (cmd /k set in_subprocess=y ^& %0 %*) & exit )
:Top
  for /f "delims=" %%i in ('dir /b "%autostart%\*.bat"') do (
    CALL "%autostart%\%%i"
  )
  for /f "delims=" %%i in ('dir /b "%registry%\*.bat"') do (
    CALL "%registyt%\%%i"
  )
if %hide%==true set hide=cls
if %hide%==false set hide=rem
:: Kernel Version
set kver=1.5
set #internal-kver@raphtalia=%raph-name-space%-%kver%
call "%config%\Config.cmd"
Mkdir %temp%
mkdir %home%\.ulib
%hide%
Rem ------
Rem Head
Rem ------
:login
if %logout-flag%==true goto logout

:logout
set sudo=false
set logged-in=false
set login-name= 
color %default-color-bg%%default-color-txt%
set login-name=
set /p login-name=Please Type Username: 
set login-password=
set /p login-password=Please Type Password: 
%hide%
  for /f "delims=" %%i in ('dir /b "%home%\.ulib\*.usr.bat"') do (
    CALL "%home%\.ulib\%%i"
  )
if %logged-in%==false goto login
if %logged-in%==true goto head
:head
%console-hook%
set i=
Set /p i=[%raphuser%@%owner%-%device% %header1%%header2% ~]$ 
echo set l=%%%i%%%> %cache%\output.bat
:call %cache%\output.bat
for /F %%G IN ("%i%") do set "first_word=%%G"
if %first_word%==logout set logout-flag=true && goto login
if exist %bin%\console\%first_word%.cmd (
    Call %bin%\console\%first_word%.cmd %i%
) else (
    Echo Invalid Reference %first_word% [%i%] try another.
    goto Head
)
goto head

Rem ------
