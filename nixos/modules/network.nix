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
      allowedTCPPorts = [
        22
        80
        443
        5173
        3000
      ];
    };
  };

  services.resolved = {
    enable = true;
    dnssec = "allow-downgrade";
    domains = [ "~." ];
    fallbackDns = dns;
    dnsovertls = "true";
  };

  systemd.network = {
    enable = true;
    networks."10-lan" = {
      matchConfig.Name = [ "enp3s0" ];
      networkConfig = {
        # start a DHCP Client for IPv4 Addressing/Routing
        DHCP = "ipv4";
        # accept Router Advertisements for Stateless IPv6 Autoconfiguraton (SLAAC)
        IPv6AcceptRA = true;
      };
      # make routing on this interface a dependency for network-online.target
      linkConfig.RequiredForOnline = "routable";
    };
  };
}
