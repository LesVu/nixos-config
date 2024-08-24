{
  virtualisation = {
    libvirtd.enable = true;
    docker.enable = true;
  };
  programs.virt-manager.enable = true;
  services.proxmox-ve.enable = true;
}
