{ pkgs, ... }:

let

  btrbkusbKeyFile = "/root/btrbkusb.key";

in

{
  imports = [ ./hardware ];

  custom = {
    base = {
      users = [ "root" ];
      system = {
        btrfs.impermanence.extraFiles = [ btrbkusbKeyFile ];
        network.wol.interface = "enp4s0";
      };
    };
    roles.nas.enable = true;
  };

  environment = {
    etc.crypttab.text = ''
      btrbkusb UUID=401bb5fc-f62e-40d8-ab9c-1fcd0e10e86e ${btrbkusbKeyFile}
    '';
    systemPackages = [ pkgs.ffmpeg-full ];
  };

  users.users = {
    admin = {
      isNormalUser = true;
      uid = 1000;
      initialPassword = "changeme";
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCxWxGVejEPm83DEMaNxuhGTCsHAV3Peoa/kkp+/89ufZ/jYIwPhIZsOz6DG+1k42BE0N8gMKO1Bg5AYt/jEDpFxlchYkKOKCGkzFA3pjYHB6Saser9Jd9wVK5n+Dx1c+Pyfpr7pDZbHtq1WcNsUMw3FZxbg4W/CXoR/4dILEW3LiJVsZ16SB3qV5qg27xVts2ux7lbE9VjYg4XPQhmPRWWHZ0SwIb2JvUw+jTFnUJEPzinwV0EMH8tw7rQYKn6GP8ZtWqR6BJZH5gPJgJXFzdGztZ1rTQXZJeEb++KoBxVAXujsRaGSswJiGXd8dagxMarYqrzu4kFlUXjEbsxm+wTyq1LO2S8AcYG/xWP3YpoqDJMbbkvbOdXApQk0KM1BShZQxliRl3lTGV6GZQEIdXGJl5qQgDZHtbjL9pYBZGaXjnFi/aLl7r5H6ygEj0mjvscJqiJkw4xwrOvMj4I11pRttnyRzofx5995GtdTHQzwYcEqsz1Jf2+cZxKe2rjqHwOixwD3QIvJpUzX2Z5e9gmHU2Dbkcbtb6YyJUvwVH4gzz8SBbnSMZtP03nI3lUVtLgwxUobNOaGrpOOqdnB3nFec2eXFXPnJRzn8GiXEuQm8viApDdxi2GR6kqxblRFr9tIK+uefrJbaMZPGONCO/6DPmf7ZlJ8pgZ+0r/DV6bww=="
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCb5D+ZCk1kcCarv31FCwPYrZACjph2HztoBQZNox9z++1a9CQgLaXBuJ0P7MjUA2yY8Be1uH83KdwZqMeSiaOIQK53hocrsRDrBFn2hXIrbHZ0UbZqrSGltrBLVcs45GdqK5nO21Nhs5iZ3SaA748cFANWC2nqA6wNCtBpqzjMGnlCI3L/oTShRwOzlcmfLZ3pxkcQNor7n49oLbQ/NkhAfOWXtHhdc0F98i8Dy+D4zFZ7yixfRgEpg1LVQEGC5+jDPmQtzeeLJ/d7whIfFOsttqKG2fuOznQM4nNRHMBM65iptTkuAoW6J7XtYy4fZdhEKWsxlRFQz5QDlQZ8C3cD"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMdVJhGk9vy17BVLkSFd/K+FnbZzWVltIO6Jzc6LlarG"
      ];
    };

    christian = {
      isNormalUser = true;
      uid = 1001;
      initialPassword = "changeme";
      createHome = true;
      home = "/data/home/christian";
      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCxWxGVejEPm83DEMaNxuhGTCsHAV3Peoa/kkp+/89ufZ/jYIwPhIZsOz6DG+1k42BE0N8gMKO1Bg5AYt/jEDpFxlchYkKOKCGkzFA3pjYHB6Saser9Jd9wVK5n+Dx1c+Pyfpr7pDZbHtq1WcNsUMw3FZxbg4W/CXoR/4dILEW3LiJVsZ16SB3qV5qg27xVts2ux7lbE9VjYg4XPQhmPRWWHZ0SwIb2JvUw+jTFnUJEPzinwV0EMH8tw7rQYKn6GP8ZtWqR6BJZH5gPJgJXFzdGztZ1rTQXZJeEb++KoBxVAXujsRaGSswJiGXd8dagxMarYqrzu4kFlUXjEbsxm+wTyq1LO2S8AcYG/xWP3YpoqDJMbbkvbOdXApQk0KM1BShZQxliRl3lTGV6GZQEIdXGJl5qQgDZHtbjL9pYBZGaXjnFi/aLl7r5H6ygEj0mjvscJqiJkw4xwrOvMj4I11pRttnyRzofx5995GtdTHQzwYcEqsz1Jf2+cZxKe2rjqHwOixwD3QIvJpUzX2Z5e9gmHU2Dbkcbtb6YyJUvwVH4gzz8SBbnSMZtP03nI3lUVtLgwxUobNOaGrpOOqdnB3nFec2eXFXPnJRzn8GiXEuQm8viApDdxi2GR6kqxblRFr9tIK+uefrJbaMZPGONCO/6DPmf7ZlJ8pgZ+0r/DV6bww=="
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCb5D+ZCk1kcCarv31FCwPYrZACjph2HztoBQZNox9z++1a9CQgLaXBuJ0P7MjUA2yY8Be1uH83KdwZqMeSiaOIQK53hocrsRDrBFn2hXIrbHZ0UbZqrSGltrBLVcs45GdqK5nO21Nhs5iZ3SaA748cFANWC2nqA6wNCtBpqzjMGnlCI3L/oTShRwOzlcmfLZ3pxkcQNor7n49oLbQ/NkhAfOWXtHhdc0F98i8Dy+D4zFZ7yixfRgEpg1LVQEGC5+jDPmQtzeeLJ/d7whIfFOsttqKG2fuOznQM4nNRHMBM65iptTkuAoW6J7XtYy4fZdhEKWsxlRFQz5QDlQZ8C3cD"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMdVJhGk9vy17BVLkSFd/K+FnbZzWVltIO6Jzc6LlarG"
      ];
    };
  };

  system.stateVersion = import ./state-version.nix;
}
