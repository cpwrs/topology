{
  flake.modules.nixos.carson = {
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
}
