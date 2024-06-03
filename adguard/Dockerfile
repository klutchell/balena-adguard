# https://hub.docker.com/r/adguard/adguardhome
FROM adguard/adguardhome:v0.107.50@sha256:f890b77505e410e295cc96830632b46075d7263cef52c158f9331348c98e1228

# hadolint ignore=DL3018
RUN apk add --no-cache yq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ ]
