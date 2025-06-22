{ pkgs, ... }: {

  boot = {
    # kernelPackages = pkgs.linuxPackages_latest;
    kernel.sysctl = { "fs.inotify.max_user_watches" = 524288; };

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
  hardware.enableRedistributableFirmware = true;
}
