FROM debian:12.2

COPY ./tools/script.sh /tmp/script.sh

RUN apt update -y && apt install -y mariadb-server

ENTRYPOINT ["/bin/bash", "/tmp/script.sh"]