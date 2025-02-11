{
  imports = [ ./hardware ];

  custom = {
    base.users = [ "christian" ];

    roles = {
      steambox.enable = true;
    };
  };

  system.stateVersion = import ./state-version.nix;
}
