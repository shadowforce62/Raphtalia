set arg1=null
set arg2=%2
set arg3=%3
set arg4=%4
set arg5=%5
set arg6=%6
set arg7=%7
set arg8=%8
set arg9=%9
shift
shift
if %arg2%==xe goto xe
:: group check
:groups
if %group-root%==true goto rootcheck
if %group-sysr%== goto rootcheck
echo Error: User Does Not Belong to an Authorized Group.
goto end
:rootcheck

if %sudo%==true goto exicute
if %arg2%==su goto su
if %sudo%==false goto sudome

:sudome
Title [Entering Root Mode]
:sudo-top
set sudo= 
set /p sudo=[sudo] password for %raphuser%: 
cls
if %sudo%==%rootpw% goto verified 
goto tryagain

:tryagain
Echo Invalid Password Try Again...
goto sudo-top


:su
Title [Entering Root Mode]
color 06
:sudo-top-su
set sudo= 
set /p sudo=[sudo] password for %raphuser%: 
cls
if %sudo%==%rootpw% goto verified-su
goto tryagain-su

:tryagain-su
Echo Invalid Password Try Again...
goto sudo-top-su




Title [Running as Root Mode]
:verified-su
set sudo=true
color 04
goto end



Title [Running as Root Mode]
:verified
set sudo=true
cls

:exicute
call "%bin%\console\%arg2%.cmd" %arg3% %arg3% %arg4% %arg5% %arg6% %arg7% %arg8%
set sudo=false

:xe
Title [%Title-Default%]
color %default-color-bg%%default-color-txt%
set sudo=false
:end
