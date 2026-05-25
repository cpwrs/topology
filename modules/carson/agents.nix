let
  agents = {pkgs, ...}: {
    users.users.carson.packages = [
      pkgs.opencode
      pkgs.codex
      pkgs.pi-coding-agent
    ];
  };
in {
  flake.modules.nixos.carson = agents;
  flake.modules.darwin.carson = agents;
}
