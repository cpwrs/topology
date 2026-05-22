{inputs, ...}: let
  hunk = {
    lib,
    pkgs,
    ...
  }: {
    users.users.carson.packages =
      lib.singleton
      inputs.hunk.packages.${pkgs.stdenv.hostPlatform.system}.hunk;

    hjem.users.carson.xdg.config.files = {
      "git/config" = {
        generator = lib.generators.toGitINI;
        value.core.pager = "hunk pager";
      };
      "lazygit/config.yml" = {
        generator = lib.generators.toYAML {};
        value.git.pagers = lib.singleton {
          pager = "hunk pager";
        };
      };
    };
  };
in {
  flake.modules.nixos.carson = hunk;
  flake.modules.darwin.carson = hunk;
}
