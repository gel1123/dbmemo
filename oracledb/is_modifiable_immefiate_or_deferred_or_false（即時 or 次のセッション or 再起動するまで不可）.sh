#!/bin/bash
echo 'select name, issys_modifiable from v$parameter;' | sqlplus / as sysdba | less -S
