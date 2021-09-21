#!/bin/bash

#Start PHP-FPM socket handler
echo "Starting php7.4-fpm..."
service php7.4-fpm start

#Start webserver
echo "Starting nginx..."
service nginx start

while true
do
if service php7.4-fpm status > /dev/null && service nginx status > /dev/null
then
    sleep 5
else
    echo "nginx or php is not running (anymore)... Exiting"
    exit 1
fi
done