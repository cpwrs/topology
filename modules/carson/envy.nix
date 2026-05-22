{inputs, ...}: let
  envy = {pkgs, ...}: {
    users.users.carson.packages = [
      inputs.envy.packages.${pkgs.system}.default
      pkgs.ripgrep
      pkgs.fd
    ];
    hjem.users.carson.environment.sessionVariables = {
      EDITOR = "nvim";
      MANPAGER = "nvim +Man!";
    };
  };
in {
  flake.modules.nixos.carson = envy;
  flake.modules.darwin.carson = envy;
}
