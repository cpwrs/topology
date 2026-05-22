{...}: {
  flake.modules.nixos.toaster = {lib, ...}: {
    services.xserver.videoDrivers = lib.singleton "nvidia";
    hardware.nvidia = {
      open = true;
      modesetting.enable = true;
    };
  };
}
