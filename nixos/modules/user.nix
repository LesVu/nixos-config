{ lib, config, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.char = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
      (lib.mkIf config.virtualisation.podman.enable "podman")
      (lib.mkIf config.virtualisation.podman.enable "docker")
    ];
  };
}
