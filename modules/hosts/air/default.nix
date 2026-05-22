{
  config,
  inputs,
  ...
}: {
  flake.darwinConfigurations.air = inputs.nix-darwin.lib.darwinSystem {
    modules = with config.flake.modules.darwin; [
      air
      core
      carson
    ];
  };

  flake.modules.darwin.air = {
    networking.hostName = "air";
    nixpkgs.hostPlatform = "aarch64-darwin";
    system.primaryUser = "carson";
    system.stateVersion = 6;
    time.timeZone = "America/Chicago";

    users.users.carson.home = "/Users/carson";

    homebrew.enable = true;
  };
}
