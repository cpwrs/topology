{...}: let
  fish = {
    config,
    lib,
    pkgs,
    ...
  }: {
    programs.fish.enable = true;
    environment.shells = lib.singleton pkgs.fish;
    users.users.carson.shell = pkgs.fish;

    hjem.users.carson.xdg.config.files = {
      "fish/config.fish" = {
        clobber = true;
        text = ''
          source ${config.hjem.users.carson.environment.loadEnv}

          set -g fish_transient_prompt 1
          set -g __fish_git_prompt_showdirtystate 1
          set -g __fish_git_prompt_showuntrackedfiles 1
          set -g __fish_git_prompt_showupstream auto

          if status is-interactive
            fish_vi_key_bindings
            ${lib.getExe pkgs.direnv} hook fish | source
            end
        '';
      };

      "fish/functions/fish_mode_prompt.fish" = {
        clobber = true;
        text = ''
          function fish_mode_prompt
          end
        '';
      };

      "fish/functions/fish_prompt.fish" = {
        clobber = true;
        source = ./fish_prompt.fish;
      };
      "fish/functions/fish_greeting.fish" = {
        clobber = true;
        source = ./fish_greeting.fish;
      };
    };
  };
in {
  flake.modules.nixos.carson = fish;
  flake.modules.darwin.carson = fish;
}
