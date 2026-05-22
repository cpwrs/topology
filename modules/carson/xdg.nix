let
  xdg = {config, ...}: {
    # hjem assumes every platform has these defaults without checking
    hjem.users.carson.environment.sessionVariables = {
      XDG_CACHE_HOME = "${config.hjem.users.carson.directory}/.cache";
      XDG_CONFIG_HOME = "${config.hjem.users.carson.directory}/.config";
      XDG_DATA_HOME = "${config.hjem.users.carson.directory}/.local/share";
      XDG_STATE_HOME = "${config.hjem.users.carson.directory}/.local/state";
    };
  };
in {
  flake.modules.nixos.carson = xdg;
  flake.modules.darwin.carson = xdg;
}
