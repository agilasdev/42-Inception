#!/bin/bash

if ! test -f /var/lib/mysql/$DB_NAME;
then

service mariadb start;
echo "CREATE DATABASE $DB_NAME;" > /tmp/db.sql;
echo "CREATE USER $DB_USER identified by '$DB_USER_PWD';" >> /tmp/db.sql;
echo "grant all privileges on $DB_NAME.* TO '$DB_USER'@'%';" >> /tmp/db.sql;
echo "FLUSH PRIVILEGES;" >> /tmp/db.sql;
echo "ALTER USER 'root'@'localhost' identified by '$MYSQL_ROOT_PWD';"
mysql < /tmp/db.sql;

sleep 3;
fi

service mariadb stop
mysqld
