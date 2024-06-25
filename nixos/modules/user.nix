{ pkgs, ... }: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.char = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    packages = with pkgs; [];
    hashedPassword = "$y$j9T$FVdO8DIF21wQYETYfcxo3/$.VbmzLctDc1EVnBhJeSpK/KNjwC4VoKFhzl0kG1FkP2";
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "char";
}
