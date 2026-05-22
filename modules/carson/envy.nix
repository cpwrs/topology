{inputs, ...}: {
  flake.modules.nixos.carson = {pkgs, ...}: {
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
}
