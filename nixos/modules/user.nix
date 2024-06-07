{ pkgs, ... }: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.char = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      vscode
    ];
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "char";
}
