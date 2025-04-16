{ pkgs, ... }: {
  users.users.char = {
    isNormalUser = true;
    extraGroups = [ "char" "wheel" "networkmanager" ];
    hashedPassword = "$y$j9T$FVdO8DIF21wQYETYfcxo3/$.VbmzLctDc1EVnBhJeSpK/KNjwC4VoKFhzl0kG1FkP2";
  };

  users.groups.char.gid = 1000;
}
