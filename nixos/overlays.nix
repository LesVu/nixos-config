{ inputs, system, ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      # cockpit-machines = prev.pkgs.callPackage ./cockpit-machines/package.nix { };
    })
  ];
}
