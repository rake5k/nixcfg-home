{
  custom = {
    users.christian.enable = true;
    home.enable = true;

    roles = {
      desktop = {
        enable = true;
        xserver.enable = true;
      };
      web = {
        enable = true;
      };
    };
  };

  home.stateVersion = import ./state-version.nix;
}
