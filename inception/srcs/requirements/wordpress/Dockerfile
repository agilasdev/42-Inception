FROM debian:12.2

RUN apt update -y && apt install -y nano wget unzip

RUN apt install -y php php-curl php-fpm php-bcmath \
    php-gd php-soap php-zip php-curl php-mbstring \
    php-mysqlnd php-gd php-xml php-intl php-zip

COPY ./tools/script.sh /tmp/script.sh
COPY ./conf/wp-config.php /
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/

ENTRYPOINT ["/bin/bash", "/tmp/script.sh"]
