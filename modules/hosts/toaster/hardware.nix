{...}: {
  flake.modules.nixos.toaster = {
    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia = {
      open = true;
      modesetting.enable = true;
    };
  };
}
