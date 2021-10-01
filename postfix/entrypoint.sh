#!/bin/bash

#Start postfix service
echo "Starting postfix..."
service postfix start

#Start dovecot service
echo "Starting dovecot..."
service dovecot start

#start CRON
echo "Starting cron..."
service cron start

while true
do
if service postfix status > /dev/null && service dovecot status > /dev/null
then
    sleep 5
else
    echo "postfix or dovecot is not running (anymore)... Exiting"
    exit 1
fi
done