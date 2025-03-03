# https://hub.docker.com/r/adguard/adguardhome
FROM adguard/adguardhome:v0.107.57@sha256:5c536c1e25f76693ae7ee5e64e8a029893e0f3f1778c8d2a9581383e60cfa9b9

# hadolint ignore=DL3018
RUN apk add --no-cache yq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ ]
