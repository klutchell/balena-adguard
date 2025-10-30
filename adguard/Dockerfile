# https://hub.docker.com/r/adguard/adguardhome
FROM adguard/adguardhome:v0.107.69@sha256:8a4107ec812023842ccab9e04600c5d39d3be6b15e907c34a36339c184c8fccf

# hadolint ignore=DL3018
RUN apk add --no-cache yq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ ]
