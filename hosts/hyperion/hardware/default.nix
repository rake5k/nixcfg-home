{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./configuration.nix
    ./disk-config.nix
  ];

  boot.initrd = {
    availableKernelModules = [ "r8169" ];
    network = {
      enable = true;
      udhcpc.enable = true;
      flushBeforeStage2 = true;
      ssh = {
        enable = true;
        # Use a different port so we won't always have host key conflicts
        port = 2222;
        shell = "/bin/cryptsetup-askpass";
        authorizedKeys = config.users.users.christian.openssh.authorizedKeys.keys;
        # Note that these will probably be unencrypted in our setup, but it's mostly fine
        hostKeys = [
          "/etc/secrets/initrd/ssh_host_ed25519_key"
        ];
      };
    };
  };

  environment.systemPackages = with pkgs; [
    openseachest
  ];
}
