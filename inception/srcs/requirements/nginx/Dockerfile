FROM debian:12.2

COPY ./tools/script.sh /tmp/

RUN apt update -y && apt install -y nginx openssl

ENTRYPOINT ["/bin/bash", "/tmp/script.sh"]