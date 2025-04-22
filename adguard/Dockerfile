# https://hub.docker.com/r/adguard/adguardhome
FROM adguard/adguardhome:v0.107.61@sha256:a2085b04bbfc4759e68fa1d13d4e1558aede67c783c55820e036a95a36dd3ebf

# hadolint ignore=DL3018
RUN apk add --no-cache yq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ ]
