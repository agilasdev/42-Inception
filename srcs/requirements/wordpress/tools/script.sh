#!/bin/bash

if ! test -f /var/www/html/wp-config.php;
then
mkdir -p /run/php
mkdir -p /var/www/html
chown www-data:www-data /var/www/html
chmod 755 /var/www/html

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

#mv wp-config.php /var/www/html/
#chown www-data:www-data /var/www/html/wp-config.php
#chmod 755 /var/www/html/wp-config.php

cd /var/www/html
wp core download --allow-root
wp config create --allow-root --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_USER_PWD --dbhost=mariadb

# echo "define( 'AUTH_KEY',         '$AUTH_KEY' );" >> wp-config.php
# echo "define( 'SECURE_AUTH_KEY',  '$SECURE_AUTH_KEY' );" >> wp-config.php
# echo "define( 'LOGGED_IN_KEY',    '$LOGGED_IN_KEY' );" >> wp-config.php
# echo "define( 'NONCE_KEY',        '$NONCE_KEY' );" >> wp-config.php
# echo "define( 'AUTH_SALT',        '$AUTH_SALT' );" >> wp-config.php
# echo "define( 'SECURE_AUTH_SALT', '$SECURE_AUTH_SALT' );" >> wp-config.php
# echo "define( 'LOGGED_IN_SALT',   '$LOGGED_IN_SALT' );" >> wp-config.php
# echo "define( 'NONCE_SALT',       '$NONCE_SALT' );" >> wp-config.php

wp core install --allow-root --url=$HOST --title=worpress --admin_user=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL
wp theme install twentytwentyone --allow-root
wp theme activate twentytwentyone --allow-root
fi

/usr/sbin/php-fpm8.2 -F
