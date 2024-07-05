{ pkgs-unstable, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs-unstable.vscode.fhsWithPackages (ps: with ps; [ nil nixpkgs-fmt ]);
  };
}
