if %login-name%==root set login-uname=root
if %login-uname%==root goto loginpassword
goto end
:loginpassword
if %login-password%==root goto finish
goto end
:finish
set raphuser=%login-name%
set rootpw=%login-password%
set group-restricted=true
set group-user=true
set group-root=true
set group-daemon=true
set group-system=true
set personal-files=%home%\%login-uname%
set logged-in=true
:end
