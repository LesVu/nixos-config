{ pkgs, ... }: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.char = {
    isNormalUser = true;
    extraGroups = [ "char" "networkmanager" "wheel" "libvirtd" "docker" ];
    packages = with pkgs; [ ];
    hashedPassword = "$y$j9T$FVdO8DIF21wQYETYfcxo3/$.VbmzLctDc1EVnBhJeSpK/KNjwC4VoKFhzl0kG1FkP2";
  };

  users.groups.char.gid = 1000;
  # Enable automatic login for the user.
  services.getty.autologinUser = "char";
}
