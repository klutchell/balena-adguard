# # https://hub.docker.com/r/adguard/adguardhome
FROM adguard/adguardhome:v0.107.44@sha256:049ef6c019a629b33db2ef957665b257fbd5761970a1517a309807fb128befb1

RUN apk add --no-cache yq

COPY entry.sh /entry.sh
RUN chmod +x /entry.sh

ENTRYPOINT [ "/entry.sh" ]
CMD [ ]
