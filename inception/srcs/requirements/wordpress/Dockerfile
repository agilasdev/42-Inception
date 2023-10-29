FROM debian:12

RUN apt update -y && apt install -y nano wget unzip php php-fpm php-mysqli sendmail

COPY ./tools/script.sh /tmp/
#COPY ./conf/wp-config.php /
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/

CMD ["/bin/bash", "/tmp/script.sh"]


