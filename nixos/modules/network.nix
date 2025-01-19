let
  dns = [
    "1.1.1.1#one.one.one.one"
    "1.0.0.1#one.one.one.one"
  ];
in
{
  networking = {
    dhcpcd.enable = false;
    useDHCP = false;
    nameservers = dns;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 443 5173 3000 ];
    };
  };

  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = [ "~." ];
    fallbackDns = dns;
    dnsovertls = "true";
  };

  systemd.network = {
    enable = true;
    networks = {
      "10-lan" = {
        matchConfig.Name = [ "enp3s0" ];
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
