{

  imports = [
    ./modules/bundle.nix
  ];

  disabledModules = [
    ./modules/vscode.nix
  ];

  home = {
    username = "char";
    homeDirectory = "/home/char";
    stateVersion = "24.05";
  };
}
