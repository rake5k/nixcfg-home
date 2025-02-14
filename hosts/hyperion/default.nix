{ config, ... }:

let

  btrbkusbKeyFile = "/root/btrbkusb.key";

  homeBaseFolder = "/data/home";

  passwdAdminSecret = "hyperion/passwd-admin";
  passwdChristianSecret = "hyperion/passwd-christian";
  passwdSophieSecret = "hyperion/passwd-sophie";

in

{
  imports = [ ./hardware ];

  custom = {
    base = {
      agenix.secrets = [
        passwdAdminSecret
        passwdChristianSecret
        passwdSophieSecret
      ];
      system = {
        btrfs = {
          enable = true;
          impermanence.extraFiles = [ btrbkusbKeyFile ];
        };
        network.wol.interface = "enp4s0";
      };
    };
    roles.nas.enable = true;
  };

  environment = {
    etc.crypttab.text = ''
      btrbkusb1 UUID=35263de4-8586-40db-92c3-d1afe19e9b5d ${btrbkusbKeyFile} nofail
      btrbkusb2 UUID=401bb5fc-f62e-40d8-ab9c-1fcd0e10e86e ${btrbkusbKeyFile} nofail,noauto
    '';
  };

  users = {
    mutableUsers = false;

    users = {
      admin = {
        isNormalUser = true;
        uid = 1000;
        hashedPasswordFile = config.age.secrets."${passwdAdminSecret}".path;
        extraGroups = [ "wheel" ];
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGP4EY0bKOAuEMG34lZ4cAyGpGRcbopH9GRmgi3wCf6b"
        ];
      };

      christian = {
        isNormalUser = true;
        uid = 1001;
        hashedPasswordFile = config.age.secrets."${passwdChristianSecret}".path;
        createHome = true;
        home = "${homeBaseFolder}/christian";
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGP4EY0bKOAuEMG34lZ4cAyGpGRcbopH9GRmgi3wCf6b"
        ];
      };

      sophie = {
        isNormalUser = true;
        uid = 1002;
        hashedPasswordFile = config.age.secrets."${passwdSophieSecret}".path;
        createHome = true;
        home = "${homeBaseFolder}/sophie";
      };
    };
  };

  services.ollama.acceleration = "cuda";

  system.stateVersion = import ./state-version.nix;
}
