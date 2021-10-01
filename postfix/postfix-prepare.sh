#!/bin/bash

echo "Postfix is preparing"

debconf-set-selections <<< "postfix postfix/mailname string mail.tflabs.nl"
debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"