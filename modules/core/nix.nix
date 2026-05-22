{...}: let
  nix = {
    lib,
    pkgs,
    ...
  }: {
    nixpkgs.config.allowUnfree = true;
    nix = {
      settings = {
        extra-substituters = [
          "https://cache.garnix.io"
          "https://cache.nixos.org"
        ];
        extra-trusted-public-keys = lib.singleton "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g=";
        experimental-features = [
          "flakes"
          "nix-command"
        ];

        http-connections = 50;
        warn-dirty = false;
        trusted-users = ["root" "@admin"];
      };
      channel.enable = false;
    };

    environment.systemPackages = lib.singleton pkgs.nh;
  };
in {
  flake.modules.nixos.core = {lib, ...}: {
    imports = lib.singleton nix;
    nix = {
      gc = {
        automatic = true;
        persistent = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
      optimise = {
        automatic = true;
        dates = lib.singleton "4:00";
      };
      settings.trusted-users = ["root" "@build" "@wheel" "@admin"];
    };
  };

  flake.modules.darwin.core = nix;
}
