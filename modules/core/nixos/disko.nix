{inputs, ...}: {
  flake.modules.nixos.core = inputs.disko.nixosModules.disko;
}
