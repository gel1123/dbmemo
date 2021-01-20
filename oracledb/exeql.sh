#!/bin/zsh

# If stdin has something message...
if [ -p /dev/stdin ]; then
	1=$(cat);
fi

echo "set LINESIZE 3000;\n set wrap off;\n $1" | sqlplus ora01/oracle | less -S
