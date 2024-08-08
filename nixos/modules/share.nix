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
        path = "/srv/smbnix/stores";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "create mask" = "0664";
        "directory mask" = "0775";
        "force user" = "nobody";
        "force group" = "nogroup";
      };
      tbstores = {
        path = "/srv/smbnix/tbstores";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0660";
        "directory mask" = "0770";
        "force user" = "char";
        "force group" = "char";
      };

    };
  };

  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };
}
