{ config, ... }:

let

  key = "malmok/wg-key";
  psk = "malmok/wg-psk";

in

{
  custom.base.agenix.secrets = [
    key
    psk
  ];

  networking.wg-quick.interfaces = {
    wg0 = {
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
}
