# balena-adguard

If you're looking for a way to quickly and easily get up and running with an AdGuard Home device for your home network, this is the project for you.

This project is a [balenaCloud](https://www.balena.io/cloud) stack with the following services:

- [AdGuard Home](https://adguard.com/en/adguard-home/overview.html)

balenaCloud is a free service to remotely manage and update your IoT devices through an online dashboard interface, as well as providing remote access to the AdGuard Home web interface without any additional configuation.

## Requirements

- RaspberryPi3 or a similar aarch64 device supported by BalenaCloud
- Custom domain name with Cloudflare DNS (eg. adguard.example.com)

## Getting Started

To get started you'll first need to sign up for a free balenaCloud account and flash your device.

<https://www.balena.io/docs/learn/getting-started>

## Deployment

Once your account is set up, deployment is carried out by downloading the project and pushing it to your device either via Git or the balena CLI.

### Application Environment Variables

Application envionment variables apply to all services within the application, and can be applied fleet-wide to apply to multiple devices.

|Name|Example|Purpose|
|---|---|---|
|`TZ`|`America/Toronto`|(optional) inform services of the [timezone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) in your location|
|`CERTBOT_DOMAIN`|`adguard.mydomain.com`|(optional) custom domain that points to the public IP address of your router or firewall|
|`ACME_EMAIL`|`email@address.com`|(optional) provide an email address to agree to ACME ToS|

## Usage

### Initial setup

<https://github.com/AdguardTeam/AdGuardHome/wiki/Getting-Started>

1. connect to `http:<device-ip>:3000/install.html` in your browser
2. select `All interfaces` and `8080` for Admin Web Interface listen interface
3. select `eth0` or `wlan0` and `53` for DNS server listen interface
4. provide an admin username and password

### Encryption setup

<https://github.com/AdguardTeam/AdGuardHome/wiki/Encryption>

1. forward ports `80`, `443`, and `853` on your router or firewall to the IP of your balena device
2. in the balenaCloud web dashboard define the required `CERTBOT_DOMAIN` environment variable (eg. `adguard.mydomain.com`)
3. in the balenaCloud web dashboard observe the certbot container logs to see where certs are installed
4. open the AdGuard Home web interface and go to Settings -> Encryption (`http://<device-ip>:8080/#encryption`)
5. enter your custom domain in the server name field (eg. `adguard.mydomain.com`)
6. set the certificates file path to `/etc/letsencrypt/live/adguard.mydomain.com/fullchain.pem`
7. set the private key file path to `/etc/letsencrypt/live/adguard.mydomain.com/privkey.pem`

The certificate script will run once every 24 hours to check if renewal is required.

## Author

Kyle Harding <https://klutchell.dev>

## Acknowledgments

Original software is by AdGuard: <https://adguard.com/en/adguard-home/overview.html>

## License

[MIT License](./LICENSE)
