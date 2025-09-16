{
  users.users.char = {
    isNormalUser = true;
    extraGroups = [
      "char"
      "wheel"
      "networkmanager"
    ];
    hashedPassword = "$y$j9T$M05dTvfMnIpiS.bPrvrRi.$dtSDSV1sB6gM37J6DazsJRffXx0wIw3wELDYZYuHGb1";
  };
  # users.mutableUsers = false;
  users.groups.char.gid = 1000;
}
