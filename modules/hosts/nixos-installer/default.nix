{
  config,
  inputs,
  lib,
  ...
}: {
  flake.nixosConfigurations.installer = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = lib.singleton config.flake.modules.nixos.iso;
  };
}
