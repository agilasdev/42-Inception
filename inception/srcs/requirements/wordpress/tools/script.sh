#!/bin/bash

if ! test -f /run/php;
then mkdir /run/php
fi

if ! test -f /var/www/html/wordpress;
then
mkdir /var/www/html/wordpress
chown -R www-data:www-data /var/www/html/wordpress
chmod -R 755 /var/www/html/wordpress
fi
if ! test -f /var/www/html/wordpress/wp-config.php;
then
rm -rf /var/www/html/wordpress/*

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

echo "define( 'DB_NAME', '$DB_NAME' );" >> wp-config.php
echo "define( 'DB_USER', '$DB_USER' );" >> wp-config.php
echo "define( 'DB_PASSWORD', '$DB_USER_PWD' );" >> wp-config.php

echo "define( 'AUTH_KEY',         '$AUTH_KEY' );" >> wp-config.php
echo "define( 'SECURE_AUTH_KEY',  '$SECURE_AUTH_KEY' );" >> wp-config.php
echo "define( 'LOGGED_IN_KEY',    '$LOGGED_IN_KEY' );" >> wp-config.php
echo "define( 'NONCE_KEY',        '$NONCE_KEY' );" >> wp-config.php
echo "define( 'AUTH_SALT',        '$AUTH_SALT' );" >> wp-config.php
echo "define( 'SECURE_AUTH_SALT', '$SECURE_AUTH_SALT' );" >> wp-config.php
echo "define( 'LOGGED_IN_SALT',   '$LOGGED_IN_SALT' );" >> wp-config.php
echo "define( 'NONCE_SALT',       '$NONCE_SALT' );" >> wp-config.php

mv wp-config.php /var/www/html/wordpress
chown www-data:www-data /var/www/html/wordpress/wp-config.php
chmod 755 /var/www/html/wordpress/wp-config.php

cd /var/www/html/wordpress && wp core download --allow-root
cd /var/www/html/wordpress && wp core install --allow-root --url=$HOST --title=worpress --admin_user=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL
cd /var/www/html/wordpress && wp db create --dbuser=$DB_USER --dbpass=$DB_USER_PWD --dbname=$DB_NAME --allow-root
fi

./usr/sbin/php-fpm8.2 -F
