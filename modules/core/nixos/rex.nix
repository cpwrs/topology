{inputs, ...}: {
  flake.modules.nixos.core = {
    imports = [inputs.rex.nixosModules.default];

    services.rex.loginServer = {
      enable = true;
      tailscaleServe.enable = true;
    };
  };
}
