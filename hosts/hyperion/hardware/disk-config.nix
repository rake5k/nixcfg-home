{
  disko.devices = {
    disk = {
      root = {
        type = "disk";
        device = "/dev/disk/by-id/nvme-WD_Red_SN700_1000GB_244836800440";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "cryptroot";
                settings = {
                  allowDiscards = true;
                  bypassWorkqueues = true;
                };
                content = {
                  type = "btrfs";
                  extraArgs = [
                    "-L"
                    "nixos"
                    "-f"
                  ];
                  postCreateHook = ''
                    mount -t btrfs /dev/disk/by-label/nixos /mnt
                    btrfs subvolume snapshot -r /mnt/root /mnt/root-blank
                    umount /mnt
                  '';
                  subvolumes = {
                    "/root" = {
                      mountpoint = "/";
                      mountOptions = [
                        "subvol=root"
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    "/home" = {
                      mountpoint = "/home";
                      mountOptions = [
                        "subvol=home"
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    "/nix" = {
                      mountpoint = "/nix";
                      mountOptions = [
                        "subvol=nix"
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    #"/snapshots" = {
                    #  mountpoint = "/snapshots";
                    #  mountOptions = [
                    #    "subvol=snapshots"
                    #    "compress=zstd"
                    #    "noatime"
                    #  ];
                    #};
                    "/persist" = {
                      mountOptions = [
                        "subvol=persist"
                        "compress=zstd"
                        "noatime"
                      ];
                      mountpoint = "/persist";
                    };
                    "/log" = {
                      mountpoint = "/var/log";
                      mountOptions = [
                        "subvol=log"
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    "/swap" = {
                      mountpoint = "/swap";
                      swap.swapfile.size = "32G";
                    };
                  };
                };
              };
            };
          };
        };
      };

      # Devices will be mounted and formatted in alphabetical order, and btrfs can only mount raids
      # when all devices are present. So we define an "empty" luks device on the first disk,
      # and the actual btrfs raid on the second disk, and the name of these entries matters!
      data1 = {
        type = "disk";
        device = "/dev/disk/by-id/ata-ST4000NT001-3M2101_WX11GQAN";
        content = {
          type = "gpt";
          partitions = {
            crypt_p1 = {
              size = "100%";
              content = {
                type = "luks";
                name = "data1";
              };
            };
          };
        };
      };
      data2 = {
        type = "disk";
        device = "/dev/disk/by-id/ata-ST4000NT001-3M2101_WX11G7M8";
        content = {
          type = "gpt";
          partitions = {
            crypt_p2 = {
              size = "100%";
              content = {
                type = "luks";
                name = "data2";
                content = {
                  type = "btrfs";
                  extraArgs = [
                    "-d raid1"
                    "/dev/mapper/data1" # Use decrypted mapped device, same name as defined in disk1
                  ];
                  subvolumes = {
                    "/data" = {
                      mountpoint = "/data";
                      mountOptions = [
                        "subvol=data"
                        "compress=zstd"
                        "rw"
                        "relatime"
                      ];
                    };
                    "/data/snapshots" = {
                      mountpoint = "/data/snapshots";
                      mountOptions = [
                        "subvol=snapshots"
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    "/data/container" = {
                      mountpoint = "/data/container";
                      mountOptions = [
                        "subvol=container"
                        "compress=zstd"
                        "rw"
                        "relatime"
                      ];
                    };
                    "/data/home" = {
                      mountpoint = "/data/home";
                      mountOptions = [
                        "subvol=home"
                        "compress=zstd"
                        "rw"
                        "relatime"
                      ];
                    };
                    "/data/plex" = {
                      mountpoint = "/data/plex";
                      mountOptions = [
                        "subvol=plex"
                        "compress=zstd"
                        "rw"
                        "relatime"
                      ];
                    };
                    "/data/syncthing" = {
                      mountpoint = "/data/syncthing";
                      mountOptions = [
                        "subvol=syncthing"
                        "compress=zstd"
                        "rw"
                        "relatime"
                      ];
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };

  boot = {
    kernelParams = [
      # https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate#Acquire_swap_file_offset
      # use: `btrfs inspect-internal map-swapfile -r /swap/swapfile`
      "resume_offset=533760"
    ];
    resumeDevice = "/dev/disk/by-label/nixos";
  };

  fileSystems."/var/log".neededForBoot = true;

  services.btrfs.autoScrub.fileSystems = [
    "/"
    "/data"
  ];
}
