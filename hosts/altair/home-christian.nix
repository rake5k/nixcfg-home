{
  imports = [
    ./home/grobi
  ];

  custom = {
    users.christian.enable = true;
    home.enable = true;

    roles = {
      desktop.enable = true;
      gaming.enable = true;
      graphics.enable = true;
      multimedia = {
        enable = true;
        converters.enable = true;
      };
      office.enable = true;
      web.enable = true;
    };
  };
}
