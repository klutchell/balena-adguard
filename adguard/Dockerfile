# https://hub.docker.com/r/adguard/adguardhome
FROM adguard/adguardhome:v0.107.51@sha256:3a143e6c071cd72b1aa5aa46ba0205a86f085d54daca94b7fc7ab6759e3fb6fa

# hadolint ignore=DL3018
RUN apk add --no-cache yq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ ]
