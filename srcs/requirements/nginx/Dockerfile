FROM debian:12

RUN apt update -y && apt install -y nginx openssl

COPY ./tools/script.sh /tmp/

CMD ["/bin/bash", "/tmp/script.sh"]