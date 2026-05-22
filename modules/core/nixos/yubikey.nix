{
  flake.modules.nixos.core = {pkgs, ...}: {
    services.udev.packages = [pkgs.libfido2];
    environment.systemPackages = [
      pkgs.yubikey-manager
      pkgs.libfido2
    ];
  };
}
