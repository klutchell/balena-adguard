#!/usr/bin/env sh

set -e

CONFIG_FILE="/opt/adguardhome/conf/AdGuardHome.yaml"

get_ipv4() {
    ip -4 -o addr show "${1}" | awk '{print $4}' | cut -d "/" -f 1
}

# get the ipv4 for each provided interface, if any
if [ -f "${CONFIG_FILE}" ] && [ -n "${DNS_INTERFACES}" ]; then

    echo "Config file exists and DNS_INTERFACES is set, getting ipv4 addresses for interfaces..."
    for interface in ${DNS_INTERFACES}; do
        while true; do
            ipv4_address="$(get_ipv4 "${interface}")"

            if [ -n "${ipv4_address}" ]; then
                bind_hosts="${bind_hosts:+${bind_hosts},}${ipv4_address}"
                break
            fi

            # this loop will run forever if the interface never gets an ipv4 address
            echo "Waiting for interface ${interface} to get an IPv4 address..."
            sleep 5
        done
    done

    # if we found ipv4 addresses for the interfaces, update the config yaml
    if [ -n "${bind_hosts}" ]; then
        echo "Setting bind hosts to ${bind_hosts}..."
        bind_hosts="[${bind_hosts}]" yq e '.dns.bind_hosts = env(bind_hosts)' "${CONFIG_FILE}" >"${CONFIG_FILE}.tmp"
        mv "${CONFIG_FILE}.tmp" "${CONFIG_FILE}"
    fi
fi

# start adguard with the updated configuration
exec /opt/adguardhome/AdGuardHome \
    --no-check-update \
    --web-addr 0.0.0.0:80 \
    -c "${CONFIG_FILE}" \
    -w /opt/adguardhome/work \
    "$@"
