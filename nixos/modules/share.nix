{
  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    extraConfig = ''
      workgroup = WORKGROUP
      server string = smbnix
      netbios name = smbnix
      security = user 
      #use sendfile = yes
      #max protocol = smb2
      # note: localhost is the ipv6 localhost ::1
      hosts allow = 192.168.0. 127.0.0.1 localhost 0.0.0.0/0
      #hosts deny = 0.0.0.0/0
      guest account = nobody
      map to guest = bad user
    '';
    shares = {
      stores = {
        path = "/export";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "guest only" = "yes";
        "create mask" = "0644";
        "directory mask" = "0755";
      };
    };
  };

  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };
}
