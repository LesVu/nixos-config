{
  users.users.char = {
    isNormalUser = true;
    extraGroups = [
      "char"
      "wheel"
      "networkmanager"
      "video"
      "input"
    ];
  };

  users.groups.char.gid = 1000;
}
