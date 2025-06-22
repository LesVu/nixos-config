{
  users.users.char = {
    isNormalUser = true;
    extraGroups = [ "char" "wheel" "libvirtd" "docker" ];
  };

  users.groups.char.gid = 1000;
}
