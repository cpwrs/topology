{
  flake.modules.nixos.core = {config, ...}: {
    services.tailscale = {
      enable = true;
      interfaceName = "ts0";
    };
    networking.firewall.interfaces.${config.services.tailscale.interfaceName}.allowedTCPPorts = [22];
  };

  flake.modules.darwin.core = {
    services.tailscale.enable = true;
  };
}
