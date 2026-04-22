# https://hub.docker.com/r/adguard/adguardhome
FROM adguard/adguardhome:v0.107.74@sha256:f29c58a91f79387cbbbb042e140814f58e830d457d44af03d662c8df43db9dea

# hadolint ignore=DL3018
RUN apk add --no-cache yq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ ]
