:: Set your name(s) below remember no spaces!
:: also set your build number and group/privalage requirements!

set #author-name-@your-package=
set #build-number@your-package=
set #package-name@your-package=

::Initialize
set arg1=%1
set arg2=%2
set arg3=%3
set arg4=%4
set arg5=%5
set arg6=%6
set arg7=%7
set arg8=%8
set arg9=%9

:: Help Loadout
if %arg2%==-? goto help 
goto rootcheck

:: root check
:RootCheck
if %sudo%==true goto ElevationCheck
if %sudo%==false echo Error: User not sudo, run command with sudo or sudo su.
goto end


::Elevation Check
:ElevationCheck
if %elevation%==user goto groups
if %elevation%==admin goto groups
if %elevation%==wine goto groups
echo Elevation Check Failed!
goto end

:: group check
:groups
if %group-root%==true goto okay
:: if %group-user%== goto okay
:: if %group-restricted%==true goto okay
echo Error: User Does Not Belong to an Authorized Group.
goto end

::

:okay
:: Delete the 'rem' To allow the last typed command to be recalled if output is enabled
rem call %cache%\output.bat
:: Start of Command Field
shift
shift
set homefix=%home%
call etc\fs\fs.conf.bat
set etcfix=%etc%
set rootfix=%root%
set login-name=login-name
set login-uname=login-uname
set login-password=login-password
set home=home
set v1=%arg2%
set vv=%arg3%
set g-r=%arg4%
set g-d=%arg5%
set g-s=%arg6%
set g-u=%arg7%
set g-x=true

echo if %%%login-name%%%==%v1% set login-uname=%v1%>%homefix%\.ulib\%v1%.usr.bat
echo if %%%login-uname%%%==%v1% goto loginpassword>>%homefix%\.ulib\%v1%.usr.bat
echo goto end>>%homefix%\.ulib\%v1%.usr.bat
echo :loginpassword>>%homefix%\.ulib\%v1%.usr.bat
echo if %%%login-password%%%==%vv% goto finish>>%homefix%\.ulib\%v1%.usr.bat
echo goto end>>%homefix%\.ulib\%v1%.usr.bat

echo :finish>>%homefix%\.ulib\%v1%.usr.bat
echo set raphuser=%%%login-name%%%>>%homefix%\.ulib\%v1%.usr.bat
echo set rootpw=%%%login-password%%%>>%homefix%\.ulib\%v1%.usr.bat
echo set group-restricted=%g-x%>>%homefix%\.ulib\%v1%.usr.bat
echo set group-user=%g-u%>>%homefix%\.ulib\%v1%.usr.bat
echo set group-root=%g-r%>>%homefix%\.ulib\%v1%.usr.bat
echo set group-daemon=%g-d%>>%homefix%\.ulib\%v1%.usr.bat
echo set group-system=%g-s%>>%homefix%\.ulib\%v1%.usr.bat
echo set personal-files=%%%home%%%\%%%login-uname%%%>>%homefix%\.ulib\%v1%.usr.bat
echo set logged-in=true>>%homefix%\.ulib\%v1%.usr.bat
echo :end>>%homefix%\.ulib\%v1%.usr.bat


set raphuser=%v1%
set login-name=%v1%
set rootpw=%vv%
set home=%homefix%
md %home%\%login-name%
cd %home%\%login-name%
md Downloads Desktop Documents Music .trash .data Videos Projects Images
set etc=%etcfix%
set root=%rootfix%
cd %root%
shift
shift
:: Usable Command Arguments: %arg2% %arg3% %arg4% %arg5% %arg6% %arg7% %arg8% %arg9% 
::                           %i% (The output of the last command)
:: End of Command Field
goto end
:help

Echo Switches /? (Displays this menu)
Echo - example:
Echo - new-user username password true true true true true
Echo - option 1 root (recomended=true)
Echo - option 2 deamon (recomended=false)
Echo - option 3 system (recomended=false)
Echo - option 4 user (recomended=true)
Echo - 
Echo -
Echo -
Echo -------Security-------
Echo Root needed? 
Echo [Yes]
Echo -
Echo Groups Needed: 
Echo [root]  [user]
Echo [[restricted]
Echo -
Echo Admin Manifest Needed:
Echo [Yes] [No]


:end
