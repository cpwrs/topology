{
  flake.modules.nixos.core = {
    lib,
    pkgs,
    ...
  }: {
    services.udev.packages = lib.singleton pkgs.libfido2;
    environment.systemPackages = [
      pkgs.yubikey-manager
      pkgs.libfido2
    ];
  };
}
