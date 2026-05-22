{
  flake.modules.nixos.core = {...}: {
    services.upower.enable = true;
  };
}
