# https://hub.docker.com/r/tailscale/tailscale
# https://github.com/tailscale/tailscale/blob/main/cmd/containerboot/main.go
# https://tailscale.com/kb/1282/docker
# https://tailscale.com/kb/1278/tailscaled
# https://tailscale.com/kb/1241/tailscale-up
# https://tailscale.com/kb/1242/tailscale-serve
# https://tailscale.com/kb/1311/tailscale-funnel
FROM tailscale/tailscale:v1.61.11@sha256:06e993635efcfa9574147ed223424cba562f7a5f0785e3b74381477414d57227

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]

ENV TS_SOCKET /var/run/tailscale/tailscaled.sock
