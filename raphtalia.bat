:Detect-Session.lock
rem at application launch
ren "%syslocal%\session.lock" "%syslocal%\session.lock.cmd"
call "%syslocal%\session.lock.cmd"

:config
ren q.config.cfg q.config.bat
call q.config.bat
ren q.config.bat q.config.cfg

:Exicuteable
set sudo=false
set passive=false
set elevation=user

:safemodeperams
set safemode=%safemodeYN%

:bootloader
call "%etc%\kver.conf.bat"
call "%syslocal%\kernel\%kver%\kernel.bat"

:Detect-Session.lock
rem at application launch
ren "%syslocal%\session.lock" "%syslocal%\session.lock.cmd"
call "%syslocal%\session.lock.cmd"

ENDLOCAL
:end
exit