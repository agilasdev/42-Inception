#!/bin/bash

if ! test -f /var/lib/mysql/$DB_NAME;
then

service mariadb start;
echo "CREATE DATABASE $DB_NAME;" > /tmp/db.sql;
echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PWD';" >> /tmp/db.sql;
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" >> /tmp/db.sql;
echo "ALTER USER 'root'@'127.0.0.1' IDENTIFIED BY '$MYSQL_ROOT_PWD';";
echo "FLUSH PRIVILEGES;" >> /tmp/db.sql;
mysql -u root < /tmp/db.sql;

sleep 3;
fi

service mariadb stop
mysqld
