{
  # networking.networkmanager = {
  #   enable = true;
  #   insertNameservers = [ "1.1.1.1" "1.0.0.1" "8.8.8.8" "8.4.4.8" ];
  # };
  networking.dhcpcd.enable = false;
  networking.useDHCP = false;
  systemd.network = {
    enable = true;
    networks = {
      "10-lan" = {
        matchConfig.Name = [ "end0" ];
        networkConfig = {
          Bridge = "vmbr0";
        };
      };

      "10-lan-bridge" = {
        matchConfig.Name = "vmbr0";
        networkConfig = {
          IPv6AcceptRA = true;
          DHCP = "ipv4";
        };
        linkConfig.RequiredForOnline = "routable";
      };
    };
    netdevs."vmbr0" = {
      netdevConfig = {
        Name = "vmbr0";
        Kind = "bridge";
        MACAddress = "none";
      };
    };
    links."10-vmbr0" = {
      matchConfig = { OriginalName = "vmbr0"; };
      linkConfig = { MACAddressPolicy = "none"; };
    };

  };
}
