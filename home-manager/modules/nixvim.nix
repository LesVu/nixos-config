{ inputs, system, ... }:
{
  # home-manager
  home.packages = [ inputs.nixvim-flake.packages.${system}.default ];
}
