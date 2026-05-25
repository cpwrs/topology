{inputs, ...}: {
  flake.modules.nixos.iso = {
    config,
    lib,
    ...
  }: {
    imports = lib.singleton "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix";
    isoImage.makeEfiBootable = true;
    isoImage.makeUsbBootable = true;
    isoImage.storeContents = lib.singleton config.system.build.toplevel;

    hardware = {
      enableAllHardware = true;
      enableAllFirmware = true;
    };

    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "broadcom-bt-firmware"
        "b43-firmware"
        "xone-dongle-firmware"
        "facetimehd-calibration"
        "facetimehd-firmware"
      ];

    users.users.root.initialHashedPassword = "";
  };
}
