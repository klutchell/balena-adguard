# https://hub.docker.com/r/adguard/adguardhome
FROM adguard/adguardhome:v0.107.44@sha256:049ef6c019a629b33db2ef957665b257fbd5761970a1517a309807fb128befb1

# hadolint ignore=DL3018
RUN apk add --no-cache yq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ ]
