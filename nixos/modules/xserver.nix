{
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
    extraConfig = ''
      Section "ServerFlags"
        Option "AutoAddGPU" "off"
      EndSection

      Section "OutputClass"
        Identifier "kmsdev"
        MatchDriver "modesetting"
        Option "kmsdev" "/dev/dri/card1"
      EndSection
    '';
    videoDrivers = [
      "modesetting"
    ];
  };
}
