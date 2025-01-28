{
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
    priority = 999;
  };
  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 16 * 1024;
  }];
}
