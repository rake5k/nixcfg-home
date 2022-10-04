{
  imports = [
    ./home/grobi
  ];

  custom = {
    users.christian = {
      enable = true;
    };

    roles = {
      desktop.enable = true;
      gaming.enable = true;
      graphics.enable = true;
      multimedia.enable = true;
      office.enable = true;
      web.enable = true;
    };
  };
}
