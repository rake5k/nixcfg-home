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
      multimedia.enable = true;
      web.enable = true;
    };
  };
}
