let
  agents = {
    config,
    pkgs,
    ...
  }: {
    users.users.carson.packages = [
      pkgs.opencode
      pkgs.codex
      pkgs.pi-coding-agent
    ];

    hjem.users.carson = {
      environment.sessionVariables.PI_CODING_AGENT_DIR = "${config.hjem.users.carson.xdg.config.directory}/pi";
      xdg.config.files = {
        "pi/AGENTS.md" = {
          clobber = true;
          source = ./AGENTS.md;
        };
        "opencode/AGENTS.md" = {
          clobber = true;
          source = ./AGENTS.md;
        };
      };
    };
  };
in {
  flake.modules.nixos.carson = agents;
  flake.modules.darwin.carson = agents;
}
