#!/bin/bash

openssl req -new -newkey rsa:2048 -keyout $PKEY -out $CERTS -nodes -subj "/C=MA/ST=Marrakech/L=Ben Guerir/O=1337./CN=ymourchi"


nginx -g "daemon off"