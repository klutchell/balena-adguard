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

- `TZ` - (optional) inform services of the [timezone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) in your location (eg. `America/Toronto`)
- `CF_API_EMAIL` - (optional) cloudflare account email (eg. `foo@bar.com`)
- `CF_API_KEY` - (optional) cloudflare global API key (eg. `0123456789abcdef0123456789abcdef01234567`)
- `CF_DOMAINS` - (optional) cloudflare domain or subdomain (eg. `adguard.mydomain.com`)

## Usage

### Initial setup

<https://github.com/AdguardTeam/AdGuardHome/wiki/Getting-Started>

1. connect to `http:<device-ip>:80/install.html` in your browser
2. select `All interfaces` and `80` for Admin Web Interface listen interface
3. select `eth0` or `wlan0` and `53` for DNS server listen interface
4. provide an admin username and password

### Encryption setup

<https://github.com/AdguardTeam/AdGuardHome/wiki/Encryption>

1. in the BalenaCloud Web Dashboard - provide the 3 required CLOUDFLARE application environment variables as defined above
2. in the BalenaCloud Web Dashboard - observe the certbot container logs to see if certs were successfully generated
3. open AdGuard Home web interface and go to Settings -> Encryption
4. write your domain name in the Server name field (eg. `adguard.mydomain.com`)
5. set the certificates file path to `/etc/letsencrypt/live/adguard.mydomain.com/fullchain.pem`
6. set the private key file path to `/etc/letsencrypt/live/adguard.mydomain.com/privkey.pem`

The certificate script will run once every 24 hours to check if renewal is required.

## Author

Kyle Harding <https://klutchell.dev>

## Acknowledgments

Original software is by AdGuard: <https://adguard.com/en/adguard-home/overview.html>

## License

[MIT License](./LICENSE)
