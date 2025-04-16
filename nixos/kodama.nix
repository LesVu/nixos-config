{ lib, ... }{
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
  services.udev.extraHwdb = lib.mkBefore ''
    sensor:modalias:platform:*
      ACCEL_MOUNT_MATRIX=0, 1, 0; -1, 0, 0; 0, 0, 1
  '';
  services.udev.extraRules = lib.mkBefore ''
    ENV{DEVNAME}=="/dev/input/event6",ENV{LIBINPUT_CALIBRATION_MATRIX}="0 -1 1 1 0 0"  
  '';
}
