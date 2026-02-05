{
  boot = {
    kernel.sysctl = {
      "fs.inotify.max_user_watches" = 524288;
    };
    loader.raspberry-pi.bootloader = "kernel";
  };

}
