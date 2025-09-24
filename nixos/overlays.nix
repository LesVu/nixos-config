{ inputs, system, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      # e.g.
      # cockpit-machines = prev.pkgs.callPackage ./cockpit-machines/package.nix { };

      inherit (prev.lixPackageSets.stable)
        nixpkgs-review
        nix-eval-jobs
        nix-fast-build
        colmena
        ;
    })
  ];
}
