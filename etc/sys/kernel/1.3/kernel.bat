@echo off

if not defined in_subprocess (cmd /k set in_subprocess=y ^& %0 %*) & exit )
:Top
  for /f "delims=" %%i in ('dir /b "%autostart%\*.bat"') do (
    CALL "%autostart%\%%i"
  )

set hide=echo null
:: Kernel Version
set kver=1.3
set #internal-kver@raphtalia=%kver%
call "%config%\Config.cmd"
Mkdir %temp%
mkdir %home%\.ulib
Echo %root%
Echo %temp%
Echo %za%
Echo %wget%
Echo %Clvl%
%hide%
Rem ------
Rem Head
Rem ------
:login
set sudo=false
set logged-in=false
set login-name= 
color %default-color-bg%%default-color-txt%
set login-name=
set /p login-name=Please Type Username:
cls
set login-password=
set /p login-password= Please Type User Password For %login-uname%
cls
  for /f "delims=" %%i in ('dir /b "%home%\.ulib\*.usr.bat"') do (
    CALL "%home%\.ulib\%%i"
  )
if %logged-in%==false goto login
if %logged-in%==true goto head
:head
set i=
Set /p i=%device%%raphuser%%header1%%header2%/ ~: 
echo set l=%%%i%%%> %cache%\output.bat
:call %cache%\output.bat
for /F %%G IN ("%i%") do set "first_word=%%G"
if %first_word%==logout goto login
if exist %bin%\console\%first_word%.cmd (
    Call %bin%\console\%first_word%.cmd %i%
) else (
    Echo Invalid Reference %first_word% [%i%] try another.
    goto Head
)
goto head

Rem ------
