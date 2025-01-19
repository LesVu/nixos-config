{ inputs, system, ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      # e.g.
      # cockpit-machines = prev.pkgs.callPackage ./cockpit-machines/package.nix { };
    })
  ];
}
