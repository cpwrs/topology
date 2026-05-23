{...}: {
  flake.modules.nixos.toaster = {lib, ...}: {
    hardware.facter.reportPath = ./facter.json;
    services.xserver.videoDrivers = lib.singleton "nvidia";
    hardware.nvidia = {
      open = true;
      modesetting.enable = true;
    };
  };
}
