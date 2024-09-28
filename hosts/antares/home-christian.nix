{
  imports = [
    ./home/grobi
  ];

  custom = {
    users.christian.enable = true;
    home.enable = true;

    roles = {
      desktop = {
        enable = true;
        xserver = {
          enable = true;
          grobi.enable = true;
        };
      };
      gaming.enable = true;
      multimedia.enable = true;
      web.enable = true;
    };
  };

  home.stateVersion = import ./state-version.nix;
}
