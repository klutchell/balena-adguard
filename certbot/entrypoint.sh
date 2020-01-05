#!/bin/sh

# if required vars are not set then halt
[ -n "${CERTBOT_DOMAIN}" ] || cat

while :
do
    # get certs for provided domain(s)
    certbot certonly -n --agree-tos --standalone --preferred-challenges http -d "${CERTBOT_DOMAIN}"

    # wait 24-hours before renewing
    sleep 86400
done