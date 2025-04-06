{
  imports = [
    ./hardware
    ./wireguard
  ];

  custom = {
    base.users = [ "christian" ];

    roles = {
      backup.rsync.jobs.backup.paths = [ "/var/lib" ];
      desktop = {
        enable = true;
        mobile.enable = true;
      };
    };
  };

  system.stateVersion = import ./state-version.nix;
}
