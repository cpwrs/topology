{inputs, ...}: {
  perSystem = {
    lib,
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      packages =
        [
          pkgs.nixd
          pkgs.alejandra
          pkgs.age
          inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
        ]
        ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux (lib.singleton pkgs.nixos-facter);
    };
  };
}
