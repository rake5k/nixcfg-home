{ config, ... }:

let

  interfaceName = "wg0";

  key = "malmok/wg-key";
  psk = "malmok/wg-psk";

in

{
  custom.base.agenix.secrets = [
    key
    psk
  ];

  networking = {
    domain = "home.local";
    wg-quick.interfaces = {
      "${interfaceName}" = {
        address = [
          "10.0.10.2/32"
        ];
        dns = [
          "10.0.10.1"
        ];
        privateKeyFile = config.age.secrets."${key}".path;

        peers = [
          {
            publicKey = "TwJwav0wXD9RdE0K2RkBd+Y8yfDkzkw3A4ZoBOOpv2M=";
            presharedKeyFile = config.age.secrets."${psk}".path;
            allowedIPs = [
              "::/0"
              "0.0.0.0/0"
            ];
            endpoint = "ras.harke.ch:51820";
            persistentKeepalive = 25;
          }
        ];
      };
    };
  };

  systemd.services."wg-quick-${interfaceName}".serviceConfig = {
    Restart = "on-failure";
    RestartSec = 5;
  };
}
