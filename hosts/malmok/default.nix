{ config, pkgs, ... }:

{
  imports = [ ./hardware ];

  custom = {
    base.users = [ "christian" ];

    roles = {
      desktop = {
        enable = true;
        mobile.enable = true;
      };
    };
  };

  networking.wg-quick.interfaces = {
    wg0 = {
      address = [
        "10.0.10.2/32"
      ];
      dns = [
        "10.0.10.1"
      ];
      privateKeyFile = "/home/christian/.local/share/secrets/wireguard_key";

      peers = [
        {
          publicKey = "TwJwav0wXD9RdE0K2RkBd+Y8yfDkzkw3A4ZoBOOpv2M=";
          presharedKeyFile = "/home/christian/.local/share/secrets/wireguard_psk";
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

  system.stateVersion = import ./state-version.nix;
}
