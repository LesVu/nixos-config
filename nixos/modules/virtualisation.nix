{
  virtualisation = {
    # libvirtd.enable = true;
    # Podman - Enable the following two option
    # containers.enable = true;
    # podman = {
    #   enable = true;
    #   # Create a `docker` alias for podman, to use it as a drop-in replacement
    #   dockerCompat = true;
    #   # Alias podman socket to docker
    #   dockerSocket.enable = true;
    #   # Required for containers under podman-compose to be able to talk to each other.
    #   defaultNetwork.settings.dns_enabled = true;
    # };
    # Docker
    docker = {
      enable = true;
      enableOnBoot = true;
    };
  };
  # programs.virt-manager.enable = true;
}
