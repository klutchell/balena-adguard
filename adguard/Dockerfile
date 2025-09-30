# https://hub.docker.com/r/adguard/adguardhome
FROM adguard/adguardhome:v0.107.67@sha256:927dc14b3e3cbd359e84658914590270a77d54446a6565e9498bef3444c286a4

# hadolint ignore=DL3018
RUN apk add --no-cache yq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ ]
