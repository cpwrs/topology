{
  flake.modules.nixos.core = {...}: {
    services.resolved = {
      enable = true;
      settings.Resolve.DNSOverTLS = "opportunistic";
    };
  };
}
