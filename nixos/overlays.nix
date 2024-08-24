{ inputs, system, ... }: {
  nixpkgs.overlays = [
    inputs.proxmox-nixos.overlays.${system}
    (final: prev: {
      # cockpit-machines = prev.pkgs.callPackage ./cockpit-machines/package.nix { };
    })
  ];
}
