{ pkgs, ... }: {

  virtualisation = {
    libvirtd.enable = true;

    docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
  programs.virt-manager = {
    enable = true;
    package = pkgs.virt-manager;
  };
}

