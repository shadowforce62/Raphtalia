ren q.config.cfg q.config.bat
call q.config.bat
ren q.config.bat q.config.cfg
set sudo=true
set passive=true
set elevation=admin
call %etc%\kver.conf.bat
call %syslocal%\kernel\%kver%\kernel.bat
