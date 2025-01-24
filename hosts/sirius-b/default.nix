{
  imports = [ ./hardware ];

  custom = {
    base.users = [
      "root"
      "christian"
    ];

    roles = {
      steambox.enable = true;
    };
  };

  system.stateVersion = import ./state-version.nix;
}
