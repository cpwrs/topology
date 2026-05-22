{inputs, ...}: {
  flake.modules.nixos.core = inputs.agenix.nixosModules.default;
  flake.modules.darwin.core = inputs.agenix.darwinModules.age;
}
