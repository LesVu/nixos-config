{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhsWithPackages (ps: with ps; [ nil nixpkgs-fmt ]);
  };
}
