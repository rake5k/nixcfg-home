{
  custom = {
    base.non-nixos.enable = true;
    users.christian.enable = true;

    roles = {
      gaming.retro.enable = true;
      web.enable = true;
    };
  };

  home = {
    username = "deck";
    stateVersion = import ./state-version.nix;
  };
}
