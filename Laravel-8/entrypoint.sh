#!/bin/bash

#Start PHP-FPM socket handler
echo "Starting php8.0-fpm..."
service php8.0-fpm start

#Start webserver
echo "Starting nginx..."
service nginx start

while true
do
if service php8.0-fpm status > /dev/null && service nginx status > /dev/null
then
    sleep 5
else
    echo "nginx or php is not running (anymore)... Exiting"
    exit 1
fi
done