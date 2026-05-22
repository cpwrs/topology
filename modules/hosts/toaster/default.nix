{
  config,
  inputs,
  ...
}: {
  flake.nixosConfigurations.toaster = inputs.nixpkgs.lib.nixosSystem {
    modules = with config.flake.modules.nixos; [
      toaster
      core
      carson
      desktop
    ];
  };

  flake.modules.nixos.toaster = {
    networking.hostName = "toaster";
    nixpkgs.hostPlatform = "x86_64-linux";
    system.stateVersion = "25.11";
    time.timeZone = "America/Chicago";
  };
}
