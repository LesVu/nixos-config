{
  boot.kernel.sysctl = {
    "fs.inotify.max_user_watches" = 524288;
  };

  hardware.raspberry-pi.config = {
    all = {
      dt-overlays = {
        vc4-kms-v3d-pi5 = {
          enable = true;
          params = { };
        };
        vc4-kms-v3d = {
          enable = false;
          params = { };
        };
      };
    };
  };
}
