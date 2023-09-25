#!/bin/bash

sed -i "s/\"admin\" =>/\"$USERNAME\" =>/" ./storm-web/config.php
sed -i "s/\"password\" => \"admin\"/\"password\" => \"$PASSWORD\"/" ./storm-web/config.php

cp -R storm-web/* /var/www/html

ngrok authtoken $NGROK_API_KEY
chown -R www-data:www-data /var/www
echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf
apache2ctl start

exec ngrok http 80
