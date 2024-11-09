{
  imports = [ ./home/grobi ];

  custom = {
    users.christian.enable = true;
    home.enable = true;

    roles = {
      containers.enable = true;
      desktop = {
        enable = true;
        xserver.enable = true;
      };
      gaming.enable = true;
      graphics.enable = true;
      multimedia = {
        enable = true;
        converters.enable = true;
      };
      office.enable = true;
      web = {
        enable = true;
        nextcloud-client.enable = true;
      };
    };
  };

  home.stateVersion = import ./state-version.nix;
}
