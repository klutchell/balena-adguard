# https://hub.docker.com/r/adguard/adguardhome
FROM adguard/adguardhome:v0.107.64@sha256:23243d0004d9398cf9c83bdfce3dd92005df72aef010f537e7325a021f31a6f5

# hadolint ignore=DL3018
RUN apk add --no-cache yq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ ]
