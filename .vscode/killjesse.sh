#!/bin/sh
if [pgrep -f '/usr/local/bin/python /usr/local/bin/jesse run']
then 
    pkill -f '/usr/local/bin/python /usr/local/bin/jesse run'; 
fi

