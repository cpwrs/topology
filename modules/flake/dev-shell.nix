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
          inputs.agenix.packages.${pkgs.system}.default
        ]
        ++ lib.optionals pkgs.stdenv.isLinux [
          pkgs.nixos-facter
        ];
    };
  };
}
