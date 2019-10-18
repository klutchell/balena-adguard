#!/bin/sh

# if required vars are not set then halt
[ -n "${CF_API_EMAIL}" ] || cat
[ -n "${CF_API_KEY}" ] || cat
[ -n "${CF_DOMAINS}" ] || cat

# write a secure cloudflare credentials file
# https://certbot-dns-cloudflare.readthedocs.io/en/stable/#
cat > ~/.cloudflare.ini << EOF
dns_cloudflare_email = ${CF_API_EMAIL}
dns_cloudflare_api_key = ${CF_API_KEY}
EOF

# set permissions
chmod 0400 ~/.cloudflare.ini

while :
do
    # get certs for provided domain(s)
    certbot certonly -n \
        --agree-tos \
        --dns-cloudflare \
        --dns-cloudflare-credentials ~/.cloudflare.ini \
        -m "${CF_API_EMAIL}" \
        -d "${CF_DOMAINS}"

    # wait 24-hours before renewing
    sleep 86400
done