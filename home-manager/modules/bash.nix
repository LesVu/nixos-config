{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases =
      let
        flakeDir = "~/nix";
      in
      {
        rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
        upd = "nix flake update ${flakeDir}";
        upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";

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
