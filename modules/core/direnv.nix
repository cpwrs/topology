let
  direnv = {...}: {
    programs = {
      direnv = {
        enable = true;
        nix-direnv.enable = true;
      };
    };
  };
in {
  flake.modules.nixos.core = direnv;
  flake.modules.darwin.core = direnv;
}
