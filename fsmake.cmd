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
rem if %sudo%==true goto ElevationCheck
rem if %sudo%==false echo Error: User not sudo, run command with sudo or sudo su.
rem goto end


::Elevation Check
:ElevationCheck
:if %elevation%==user goto groups
if %elevation%==admin goto groups
if %elevation%==wine goto groups
echo Elevation Check Failed!
goto end

:: group check
:groups
if %group-root%==true goto okay
:if %group-user%== goto okay
if %group-sys%==true goto okay
:if %group-daemon%==true goto okay
:if %group-restricted%==true goto okay
echo Error: User Does Not Belong to an Authorized Group.
goto end

::

:okay
:: Delete the 'rem' To allow the last typed command to be recalled if output is enabled
rem call %cache%\output.bat
:: Start of Command Field
shift
shift




:command Field
: %arg2% %arg3% %arg4% %arg5% %arg6% %arg7% %arg8% %arg9%
mkdir "%lime%"
mkdir "%root%"
mkdir "%etc%"
mkdir "%config%"
mkdir "%syslocal%"
mkdir "%verdat%"
mkdir "%keyring%"
mkdir "%fs%"
mkdir "%bin%"
mkdir "%home%"
mkdir "%lib%"
mkdir "%mnt%"
mkdir "%cache%"
mkdir "%registry%"
mkdir "%tmp%"
mkdir "%daerem%"
mkdir "%dev%"
mkdir "%usr%"
mkdir "%sbin%"
mkdir "%var%"
mkdir "%autostart%"
mkdir "%userlibs%"
mkdir "%devices%"
mkdir "%kernellocal%"
mkdir "%workspace-raphtalia%"
mkdir "%workspace-jre%"
mkdir "%workspace-python%"
mkdir "%workspace-html%"
mkdir "%workspace-xml%"
mkdir "%workspace-bash%"
mkdir "%workspace-dotnet%"
mkdir "%usr-local%"
mkdir "%usr-src%"
mkdir "%usr-share%"
mkdir "%usr-include%"
mkdir "%usr-lib32%"
mkdir "%usr-lib%"
mkdir "%usr-bin%"
mkdir "%device-cpu%"
mkdir "%device-bus%"
mkdir "%device-disk%"
mkdir "%device-usb%"
mkdir "%var-empty%"
mkdir "%var-games%"
mkdir "%var-local%"
mkdir "%var-db%"
mkdir "%var-log%"
mkdir "%var-lib32%"
mkdir "%var-lib%"
mkdir "%var-tmp%"
goto end




shift
shift
:: Usable Command Arguments: %arg2% %arg3% %arg4% %arg5% %arg6% %arg7% %arg8% %arg9% 
::                           %i% (The output of the last command)
:: End of Command Field
goto end
:help

Echo Switches /? (Displays this menu)
Echo -
Echo -
Echo -
Echo -
Echo -
Echo -
Echo -
Echo -
Echo -
Echo -------Security-------
Echo Root needed? 
Echo [Yes] [No] 
Echo -
Echo Groups Needed: 
Echo [root]  [user]  [sys]
Echo [deamon] [restricted]
Echo -
Echo Admin Manifest Needed:
Echo [Yes] [No]


:end
