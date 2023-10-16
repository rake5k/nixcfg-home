{
  custom = {
    roles = {
      # TODO: Remove
      homeage.enable = true;
      mobile.enable = true;
    };
    users.christian.enable = true;
  };

  home.stateVersion = import ./state-version.nix;
}
