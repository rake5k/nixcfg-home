{ lib, ... }:

let

  inherit (lib) hm mkForce;

in

{
  custom = {
    base.non-nixos.enable = true;
    users.christian = {
      enable = true;
      shell.gnutils.enable = mkForce false;
    };

    roles = {
      desktop = {
        passwordManager.enable = true;
        wiki.enable = true;
      };
      gaming = {
        comms.enable = true;
        retro.enable = true;
      };
      multimedia = {
        music.enable = true;
        video.enable = true;
      };
      web.enable = true;
    };
  };

  home = {
    activation = {
      updateAppMenu = hm.dag.entryAfter [ "writeBoundary" ] ''
        SOURCE_DIR="$HOME/.nix-profile/share/applications"
        TARGET_DIR="$HOME/.local/share/applications"

        if [[ -v DRY_RUN ]]; then
          # list dead symlinks
          find "$TARGET_DIR" -xtype l
        else
          # delete dead symlinks
          find "$TARGET_DIR" -xtype l -delete
        fi

        for app in "$SOURCE_DIR/"*.desktop; do
          if [[ -v DRY_RUN ]]; then
            echo $app
          else
            ln -fs $VERBOSE_ARG "$app" "$TARGET_DIR/"
            chmod +x $VERBOSE_ARG "$app"
          fi
        done
      '';
    };
    username = "deck";
    stateVersion = import ./state-version.nix;
  };
}
