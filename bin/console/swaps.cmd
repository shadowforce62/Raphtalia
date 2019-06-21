:: Set your name(s) below remember no spaces!
:: also set your build number and group/privalage requirements!

set #author-name-@swaps=shadowrevenant
set #build-number@swaps=2.0.0

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
if %group-user%== goto okay
if %group-sys%==true goto okay
if %group-daemon%==true goto okay
if %group-restricted%==true goto okay
echo Error: User Does Not Belong to an Authorized Group.
goto end

::

:okay
:: Delete the 'rem' To allow the last typed command to be recalled if output is enabled
rem call %cache%\output.bat
:: Start of Command Field
shift
shift

if %arg2%==-kernel goto kernel
goto end

:kernel
call etc\fs\fs.conf.bat
call etc\kver.conf.bat
echo %kver%
call %syslocal%\kernel\%arg3%\kernel.bat
exit


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
