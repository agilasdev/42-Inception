FROM debian:latest

COPY ./tools/script.sh /script.sh

RUN apt update -y && apt install nginx -y

RUN ufw allow 'Nginx HTTPS'

CMD "./script.sh"