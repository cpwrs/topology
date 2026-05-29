let
  fzf = {
    lib,
    pkgs,
    ...
  }: {
    users.users.carson.packages = lib.singleton pkgs.fzf;
    hjem.users.carson.environment.sessionVariables."FZF_DEFAULT_OPTS" = "--color 16";
  };
in {
  flake.modules.darwin.carson = fzf;
  flake.modules.nixos.carson = {
    lib,
    pkgs,
    ...
  }: {
    imports = lib.singleton fzf;
    hjem.users.carson.xdg.config.files."fish/functions/fman.fish" = {
      clobber = true;
      text = ''
        function fman
            ${lib.getExe' pkgs.man-db "apropos"} . \
                | ${lib.getExe pkgs.gawk} '{print $1 " " $2}' \
                | ${lib.getExe pkgs.fzf} --preview '${lib.getExe pkgs.man-db} {1}' \
                | ${lib.getExe' pkgs.findutils "xargs"} ${lib.getExe pkgs.man-db}
        end
      '';
    };
  };
}
