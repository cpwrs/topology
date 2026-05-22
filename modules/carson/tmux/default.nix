{...}: let
  tmux = {
    lib,
    pkgs,
    ...
  }: {
    users.users.carson.packages = lib.singleton pkgs.tmux;
    hjem.users.carson.xdg.config.files = {
      "tmux/tmux.conf" = {
        source = ./tmux.conf;
        clobber = true;
      };
    };
  };
in {
  flake.modules.nixos.carson = tmux;
  flake.modules.darwin.carson = tmux;
}
