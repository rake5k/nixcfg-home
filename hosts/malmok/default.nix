{
  imports = [
    ./hardware
    ./wireguard
  ];

  custom = {
    base.users = [
      "root"
      "christian"
    ];

    roles = {
      desktop = {
        enable = true;
        mobile.enable = true;
      };
    };
  };

  system.stateVersion = import ./state-version.nix;
}
