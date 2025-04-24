{

  imports = [
    ./modules
  ];

  disabledModules = [
    ./modules/nixvim.nix
    ./modules/tmux.nix
    ./modules/direnv.nix
  ];

  home = {
    username = "char";
    homeDirectory = "/home/char";
    stateVersion = "24.11";
  };
}
