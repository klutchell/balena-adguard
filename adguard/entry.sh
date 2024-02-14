#!/bin/sh

set -e

get_ipv4_addresses() {
    # List all interfaces and their details, exclude lines related to 'resin-dns',
    # look for lines with 'inet' indicating IPv4 addresses, and then
    # use awk to extract the IP address part.
    ip addr show | grep -v 'resin-dns' | grep 'inet ' | awk '{print $2}' | cut -d'/' -f1
}

update_adguard_bind_hosts() {
    # Get IPv4 addresses excluding 'resin-dns', assuming get_ipv4_addresses is already defined
    ipv4_addresses="$(get_ipv4_addresses | tr '\n' ',')"

    # Remove the trailing comma from ipv4_addresses
    ipv4_addresses="${ipv4_addresses%,}"

    echo "Updating AdGuardHome configuration with the following bind hosts:"
    echo "${ipv4_addresses}"

    # Use yq to update the dns.bind_hosts array
    bind_hosts="[${ipv4_addresses}]" yq e '.dns.bind_hosts = env(bind_hosts)' "$CONFIG_FILE" >"${CONFIG_FILE}.tmp"
    mv "${CONFIG_FILE}.tmp" "$CONFIG_FILE"
}

CONFIG_FILE="/opt/adguardhome/conf/AdGuardHome.yaml"

case "$(echo "${UPDATE_BIND_HOSTS}" | tr '[:upper:]' '[:lower:]')" in
true | yes | on | y | 1)
    UPDATE_BIND_HOSTS=true
    ;;
*)
    UPDATE_BIND_HOSTS=false
    ;;
esac

# Check if the config file exists
if [ -f "${CONFIG_FILE}" ] && [ "${UPDATE_BIND_HOSTS}" = "true" ]; then
    update_adguard_bind_hosts
fi

exec /opt/adguardhome/AdGuardHome \
    --no-check-update \
    --web-addr 0.0.0.0:80 \
    -c "${CONFIG_FILE}" \
    -w /opt/adguardhome/work \
    "$@"
