{
  inputs,
  ...
}:
{
  imports = [
    "${inputs.mobile-nixos}/devices/families/mainline-chromeos-mt8183"
    (import "${inputs.mobile-nixos}/lib/configuration.nix" { })
  ];
  mobile.device.name = "lenovo-kodama";
  mobile.device.identity = {
    name = "Chromebook 10e";
    manufacturer = "Lenovo";
  };
  mobile.device.supportLevel = "supported";
  mobile.hardware = {
    screen = {
      # Panel is portrait CW compared to keyboard attachment.
      width = 1200;
      height = 1920;
    };
  };

  # Ensure orientation match with keyboard.
  services.udev.extraHwdb = ''
    sensor:modalias:*
      ACCEL_MOUNT_MATRIX=0, 1, 0; -1, 0, 0; 0, 0, 1
  '';
}
