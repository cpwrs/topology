{...}: let
  ghostty = {
    pkgs,
    ...
  }: let
    package =
      if pkgs.stdenv.isDarwin
      then pkgs.ghostty-bin
      else pkgs.ghostty;
  in {
    users.users.carson.packages = [
      package
    ];
    hjem.users.carson.xdg.config.files = {
      "ghostty/config" = {
        source = ./config;
        clobber = true;
      };
    };
  };
in {
  flake.modules.nixos.carson = ghostty;
  flake.modules.darwin.carson = ghostty;
}
