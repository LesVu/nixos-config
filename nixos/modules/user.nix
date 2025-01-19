{ pkgs, ... }: {
  users.users.char = {
    isNormalUser = true;
    extraGroups = [ "char" "wheel" "libvirtd" "docker" ];
    # packages = with pkgs; [ ];
  };

  users.groups.char.gid = 1000;
}
