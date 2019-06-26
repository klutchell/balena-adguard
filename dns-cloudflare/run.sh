#!/bin/sh -ex

# only continue if the required vars are set
[ -n "${CLOUDFLARE_EMAIL}" ] || ( echo "CLOUDFLARE_EMAIL is not defined" ; exit 1 ; )
[ -n "${CLOUDFLARE_API_KEY}" ] || ( echo "CLOUDFLARE_API_KEY is not defined" ; exit 1 ; )
[ -n "${CLOUDFLARE_DOMAINS}" ] || ( echo "CLOUDFLARE_DOMAINS is not defined" ; exit 1 ; )

# write a secure cloudflare credentials file
# https://certbot-dns-cloudflare.readthedocs.io/en/stable/#
cat > /root/.secrets/cloudflare.ini << EOF
dns_cloudflare_email = ${CLOUDFLARE_EMAIL}
dns_cloudflare_api_key = ${CLOUDFLARE_API_KEY}
EOF

# set permissions
chmod 0700 /root/.secrets
chmod 0400 /root/.secrets/cloudflare.ini

while :
do
    # get certs for adguard encryption
    # https://github.com/AdguardTeam/AdGuardHome/wiki/Encryption
    certbot certonly --dns-cloudflare -n \
        --dns-cloudflare-credentials /root/.secrets/cloudflare.ini \
        -m "${CLOUDFLARE_EMAIL}" --agree-tos \
        -d "${CLOUDFLARE_DOMAINS}"

    # wait 24-hours before renewing
    sleep 86400
done