{ mobile-nixos, fetchpatch, kernel, ... }:
mobile-nixos.kernel-builder {
  inherit (kernel) src version;
  configfile = ./kodama-6.12.23.config;
  patches = [
    # CHROMIUM: Revert "serial: 8250_mtk: Fix UART_EFR register address"
    # https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/3670640
    (fetchpatch {
      url = "https://github.com/torvalds/linux/commit/4cec85ca5a098fca3d49bda9976bccaca16a8876.patch";
      sha256 = "sha256-V5d1OSJro82LIWrlJ74m5xxF26dtEe7HZmoFgUX/HBc=";
    })
    # [PATCH] arm64: dts: mediatek: mt8183: Add missing GPU clocks
    (fetchpatch {
      url = "https://gitlab.com/postmarketOS/pmaports/-/raw/master/device/community/linux-postmarketos-mediatek-mt8183/arm64-dts-mediatek-mt8183-Add-missing-GPU-clocks.patch";
      sha256 = "sha256-gvfmK2FMbThBwo3Fj68/+H9mRdax0Sic+hL9NYj1yrQ=";
    })
    # Fix Display on wayland
    (fetchpatch {
      url = "https://gitlab.collabora.com/mediatek/aiot/linux/-/commit/8f40003af37e1567e53fdfcb6446ab4b90755bc0.patch";
      sha256 = "sha256-qa8sBXdkfQqatYZt8nPJrraq7g4abmKUuOYDZPEqDcU=";
    })
  ];

  isModular = true;
  isCompressed = false;
}
