# https://hub.docker.com/r/adguard/adguardhome
FROM adguard/adguardhome:v0.107.63@sha256:320ab49bd5f55091c7da7d1232ed3875f687769d6bb5e55eb891471528e2e18f

# hadolint ignore=DL3018
RUN apk add --no-cache yq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ ]
