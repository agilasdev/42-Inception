FROM debian:12

RUN apt update -y && apt install -y mariadb-server

COPY ./tools/script.sh /tmp/
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

CMD ["/bin/bash", "/tmp/script.sh"]