{
  imports = [ ./hardware ];

  custom = {
    base.users = [ "christian" ];

    roles = {
      backup.rsync.jobs.backup.paths = [ "/var/lib" ];
      desktop.enable = true;
      gaming.enable = true;
    };
  };

  system.stateVersion = import ./state-version.nix;
}
