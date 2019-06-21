:rootcheck
if %sudo%==true exit
if %sudo%==false Echo USER NOT IN ROOT MODE: run sudo su command
