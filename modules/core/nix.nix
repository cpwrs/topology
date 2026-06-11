{...}: let
  nix = {pkgs, ...}: {
    nixpkgs.config.allowUnfree = true;

    nix = {
      settings = {
        extra-substituters = ["https://cache.nixos.org"];
        experimental-features = [
          "flakes"
          "nix-command"
        ];

        http-connections = 50;
        warn-dirty = false;
      };

      channel.enable = false;
    };

    environment.systemPackages = [pkgs.nh];
  };
in {
  flake.modules.nixos.core = {
    imports = [nix];

    nix = {
      gc = {
        automatic = true;
        persistent = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };

      optimise = {
        automatic = true;
        dates = ["4:00"];
      };

      settings.trusted-users = [
        "root"
        "@wheel"
      ];
    };
  };

  flake.modules.darwin.core = {
    imports = [nix];

    nix.settings.trusted-users = [
      "root"
      "@admin"
    ];
  };
}
