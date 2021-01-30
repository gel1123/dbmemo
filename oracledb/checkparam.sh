#!/bin/zsh

# If stdin has something message...
if [ -p /dev/stdin ]; then
	1=$(cat);
fi


echo "col name format a30;\n col value format a20;\n select name, type, value, issys_modifiable from v\$parameter;" | sqlplus / as sysdba | less -S
#echo "select name. issys_modifiable from v\$parameter where name='$1';" | sqlplus / as sysdba | less -S
