#!/bin/bash

openssl req -newkey rsa:2048 -keyout $PKEY -out $CERTS -x509 -nodes -subj "/C=MA/ST=Marrakech/L=Ben Guerir/O=1337./CN=ymourchi"

echo "
server {
    listen 443 ssl;
    listen [::]:443 ssl;
    server_name $HOST www.$HOST;
    ssl_certificate $CERTS;
    ssl_certificate_key $PKEY;
    root /var/www/html;
    ssl_protocols TLSv1.2 TLSv1.3;
    index index.php index.html index.htm;
" > /etc/nginx/sites-available/default
echo '
    location / {
        autoindex on;
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        fastcgi_split_path_info ^(.+.php)(/.+)$;
        fastcgi_pass wordpress:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
    }
}
' >> /etc/nginx/sites-available/default

nginx -g "daemon off;"