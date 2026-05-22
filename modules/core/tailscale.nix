{
  flake.modules.nixos.core = {
    config,
    lib,
    ...
  }: {
    services.tailscale = {
      enable = true;
      interfaceName = "ts0";
    };
    networking.firewall.interfaces.${config.services.tailscale.interfaceName}.allowedTCPPorts = lib.singleton 22;
  };

  flake.modules.darwin.core = {
    services.tailscale.enable = true;
  };
}
