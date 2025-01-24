{
  imports = [ ./hardware ];

  custom = {
    base.users = [
      "root"
      "christian"
    ];

    roles = {
      desktop.enable = true;
      gaming.enable = true;
    };
  };

  system.stateVersion = import ./state-version.nix;
}
