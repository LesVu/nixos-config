{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases =
      let
        flakeDir = "~/nix";
      in
      {
        rb = "nixos-rebuild switch --use-remote-sudo --flake ${flakeDir}";
        upd = "nix flake update --flake ${flakeDir}";
        upg = "nixos-rebuild switch --upgrade --use-remote-sudo --flake ${flakeDir}";

        hms = "home-manager switch --flake ${flakeDir}";

        conf = "nvim ${flakeDir}/nixos/configuration.nix";
        pkgs = "nvim ${flakeDir}/nixos/packages.nix";

        ll = "ls --color=auto -lah";
        la = "ls --color=auto -ah";
        ls = "ls --color=auto -h";
      };

    historySize = 10000;
  };
}
