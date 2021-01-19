#!/bin/zsh
echo "set LINESIZE 3000;\n set wrap off;\n $1" | sqlplus ora01/oracle | less -S
